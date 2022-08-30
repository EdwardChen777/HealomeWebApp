class CheckoutController < ApplicationController

    def create
      price = params[:price_id]
      @session = Stripe::Checkout::Session.create({
        customer: @current_user.stripe_id,
        customer_email: @current_user.email,
        payment_method_types: ['card'],
        # line_items: @cart.collect { |item| item.to_builder.attributes! },
        line_items: [{
          quantity: 1,
          price: price
        }],
        mode: 'subscription',
        success_url: success_url + "?session_id={CHECKOUT_SESSION_ID}",
        cancel_url: pricing_url,
        client_reference_id: @current_user.id
      })
      redirect_to @session.url
    end

    def success
      @session = Stripe::Checkout::Session.retrieve(params[:session_id])
      @customer = Stripe::Customer.retrieve(@session.customer)
        # if params[:session_id].present? 
        #   # session.delete(:cart)
        #   session[:cart] = [] # empty cart = empty array
        #   @session_with_expand = Stripe::Checkout::Session.retrieve({ id: params[:session_id], expand: ["line_items"]})
        #   @session_with_expand.line_items.data.each do |line_item|
        #     product = Product.find_by(stripe_product_id: line_item.price.product)
        #   end
        # else
        #   redirect_to cancel_url, alert: "No info to display"
        # end
    end
end
