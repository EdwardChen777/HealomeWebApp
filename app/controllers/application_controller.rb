require 'cognito_jwt_keys'
require 'cognito_client'
class ApplicationController < ActionController::Base
    before_action :check_signed_in
    before_action :set_stripe_key

  def check_signed_in
    @is_signed_in = false
    @current_user = nil
    @cognito_session = nil

    cognito_session = nil
    if session[:cognito_id]
      begin
        cognito_session = Cognito.find(session[:cognito_id])
      rescue ActiveRecord::RecordNotFound
      end
    end

    unless cognito_session
        Rails.logger.info("no cognito session")
      return
    end

    now = Time.now.tv_sec

    if cognito_session.expire_time > now
      # Still valid, use
      #

      Rails.logger.info("Found a non-expired cognito session: #{cognito_session.id}")
      @is_signed_in = true
      @current_user = cognito_session.user
      @cognito_session = cognito_session
      return
    end

    

    Rails.logger.info("Refreshing cognito session: #{cognito_session.id}")

    # Need to refresh token
    if refresh_cognito_session(cognito_session)
      @is_signed_in = true
      @current_user = cognito_session.user
      @cognito_session = cognito_session
      return
    end
  end

  def refresh_cognito_session(cognito_session)
    client = new_cognito_client()

    resp = client.refresh_id_token(cognito_session.refresh_token)

    return false unless resp

    cognito_session.expire_time = resp.id_token[:exp]
    cognito_session.issued_time = resp.id_token[:auth_time]
    cognito_session.audience = resp.id_token[:aud]

    cognito_session.save!
  end

  def new_cognito_client
    CognitoClient.new(:redirect_uri => auth_sign_in_url)
  end

  private
  # Handling authentication
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  
  def logged_in?
    current_user
  end
  helper_method :logged_in?
  
  def check_login
    redirect_to login_path, alert: "You need to log in to view this page." if current_user.nil?
  end

  def set_stripe_key
    Stripe.api_key = Rails.application.credentials.dig(:stripe, :secret_key)
  end

end
