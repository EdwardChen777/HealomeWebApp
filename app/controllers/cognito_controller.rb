class CognitoController < ApplicationController
  def sign_in
    redirect_to cognito_signin_url
  end

  def sign_out
    redirect_to cognito_signout_url
  end

  def sign_up
    redirect_to cognito_signup_url
  end

private

  #redirect = exp://192.168.1.37:19000/--/
  def cognito_signin_url
    # CognitoUrls.login_uri(ENV['AWS_COGNITO_WEBAPP_CLIENT_ID'],
    #                       signin_redirect_uri)
    CognitoUrls.login_uri(ENV['AWS_COGNITO_WEBAPP_CLIENT_ID'],
      "exp://192.168.1.37:19000/--/")  
  end

  def cognito_signup_url
    # CognitoUrls.signup_uri(ENV['AWS_COGNITO_WEBAPP_CLIENT_ID'],
    #                        signin_redirect_uri)
    CognitoUrls.signup_uri(ENV['AWS_COGNITO_WEBAPP_CLIENT_ID'],
      "exp://192.168.1.37:19000/--/")
  end

  def cognito_signout_url
    CognitoUrls.logout_uri(ENV['AWS_COGNITO_WEBAPP_CLIENT_ID'],
                           signout_redirect_uri)
  end

  def signin_redirect_uri
    auth_sign_in_url
  end

  def signout_redirect_uri
    auth_sign_out_url
  end
    # def sign_in
    #     user_object = {
    #       USERNAME: params[:username],
    #       PASSWORD: params[:password]
    #     }
    #     begin
    #       resp = Cognito.authenticate(user_object).authentication_result
    #     rescue => e
    #       resp = e
    #     end
    #     render json: resp
    # end
    
    # def sign_out
    #     if request.headers['Authorization']
    #       Cognito.sign_out(request.headers['Authorization'])
    #       resp = { type: 'success', message: 'now you are disconected' }
    #     else
    #       resp = { type: 'error', message: 'empty token' }
    #     end
    #     render json: resp
    # end
end
