class WebhooksController < ApplicationController
    # skip_before_action :authenticate_user!
    skip_before_action :verify_authenticity_token

    def create
        payload = request.body.read
        sig_header = request.env['HTTP_STRIPE_SIGNATURE']
        endpoint_secrets = Rails.application.dig(:stripe,:webhook_secret)
        event = nil

    begin
        event = Stripe::Webhook.construct_event(
            payload, sig_header, endpoint_secrets
        )
    rescue JSON::ParserError => e
        render json: {message: e}, status: 400
        # status 400
        # return
    rescue Stripe::SignatureVerificationError => e
        # Invalid signature
        render json: {message: e}, status: 400
        # puts "Signature error"
        # p e
        return
    end

    # Handle the event
    case event.type
    when 'checkout.session.completed'
        
        session = event.data.object
        return if !User.exists?(session.client_reference_id)
        complete_subscription(session)
        @user = User.find_by(stripe_customer_id: session.customer)
        @user.update(subscription_status: 'active')
    when 'customer.subscription.updated', 'customer.subscription.deleted'
        subscription = event.data.object
        @user = User.find_by(stripe_customer_id: subscription.customer)
        @user.update(
            subscription_status: subscription.status,
            plan: subscription.items.data[0].price.lookup_key,
        )
    when 'invoice.payment.succeeded'
        return unless event.data.object.subscription.present?
        stripe_subscription = Stripe::Subscription.retrieve(event.data.object.subscription)

        subscription = Subscription.find_by(subscription_id: stripe_subscription)
        subscription.update(
            start_date: Time.at(stripe_subscription.current_period_start).to_datetime,
            end_date: Time.at(stripe_subscription.current_period_end).to_datetime,
            plan_id: stripe_subscription.plan.id,
            interval: stripe_subscription.plan.interval,
            status: stripe_subscription.status
        )
    when 'invoice.payment_failed'
        user = User.find_by(stripe_id: event.data.object.customer)
        if user.exists?
            SubscriptionMailer.with(user: user).payment_failed.deliver_now
        end
    when 'customer.subscription.updated'
        stripe_subscription = event.data.object
        if stripe_subscription.cancel_at_period_end == true 
            subscription = Subscription.find_by(subscription_id: stripe_subscription.id)
            if subscription.present?
                subscription.update(
                    start_date: Time.at(stripe_subscription.current_period_start).to_datetime,
                    end_date: Time.at(stripe_subscription.current_period_end).to_datetime,
                    plan_id: stripe_subscription.plan.id,
                    interval: stripe_subscription.plan.interval,
                    status: stripe_subscription.status
                )
            end 
        end
    else
        puts "Unhandled event type: #{event.type}"
    end

    render json: { message: 'success' }
  end

  private
  def complete_subscription(checkout_params)
    user = User.find(checkout_params.client_reference_id)
    user.update(stripe_id: checkout_params.customer)

    stripe_subscription = Stripe::Subscription.retrieve(checkout_params.subscription)

    Subscription.create(
        customer_id: stripe_subscription.customer,
        start_date: Time.at(stripe_subscription.current_period_start).to_datetime,
        end_date: Time.at(stripe_subscription.current_period_end).to_datetime,
        plan_id: stripe_subscription.plan.id,
        interval: stripe_subscription.plan.interval,
        status: stripe_subscription.status,
        subscription_id: stripe_subscription.id,
        user: user
    )
  end
end
