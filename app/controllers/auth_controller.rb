class AuthController < ApplicationController
  include AppHelpers::Cart
    def signin
      unless params[:code]
        render :nothing => true, :status => :bad_request
        return
      end
      
      #this part need debug
      resp = lookup_auth_code(params[:code])
      
      unless resp
        redirect_to '/', notice: "IDK"
        # redirect_to home_path, notice: "IDK"
        return
      end
  
      ActiveRecord::Base.transaction do
        user = User.where(sub: resp.id_token[:sub]).first
        if user.nil?
            if resp.id_token[:email].nil?
                user = User.create(sub: resp.id_token[:sub],
                             phone: resp.id_token[:phone])
            else
                user = User.create(sub: resp.id_token[:sub],
                    email: resp.id_token[:email])
            end 
        end
  
        cognito_session = Cognito.create(user: user,
                                                expire_time: resp.id_token[:exp],
                                                issued_time: resp.id_token[:auth_time],
                                                audience: resp.id_token[:aud],
                                                refresh_token: resp.refresh_token)
        session[:cognito_id] = cognito_session.id
        session[:cart] = create_cart
      end
  
      # Alternatively, you could redirect to a saved URL
      redirect_to home_path, notice: "damn"
    #   redirect_to home_path, notice: "Logged in!"
    end
  
    def signout
      if cognito_session_id = session[:cognito_id]
        cognito_session = Cognito.find(cognito_session_id) rescue nil
        cognito_session.destroy if cognito_session
        session.delete(:cognito_id)
      end
  
      redirect_to '/', notice: "Logged out!"
    #   redirect_to home_path, notice: "Logged out!"
    end
  
    def lookup_auth_code(code)
      client = new_cognito_client()
      client.get_pool_tokens(code)
    end
  end
  