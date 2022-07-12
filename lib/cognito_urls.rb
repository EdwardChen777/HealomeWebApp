#this file sets all the urls linking to Cognito
require 'uri'
class CognitoUrls
    AUTHORIZE_PATH = "/oauth2/authorize"
    TOKEN_PATH = "/oauth2/token"
    LOGIN_PATH = "/login"
    LOGOUT_PATH = "/logout"
    SIGNUP_PATH = "/signup"
  
    class << self
      @base_oauth_uri = nil
      @base_idp_uri = nil
  
      def init(domain, region)
        @base_oauth_uri = "https://%s.auth.%s.amazoncognito.com" % [domain, region]
        @base_idp_uri = "https://cognito-idp.%s.amazonaws.com" % [region]
      end

      #base_oauth_uri = 
      #https://%s.auth.%s.amazoncognito.com

      #this is the jwks_url to retrieve jwt token
      #"https://cognito-idp.ap-south-1.amazonaws.com/ap-south-1_KNEbM0c4t/.well-known/jwks.json"
  
      def jwks_uri(pool_id)
        path = "/%s/.well-known/jwks.json" % [pool_id]
        URI.join(@base_idp_uri, path).to_s
      end
  
      def refresh_token_uri
        @base_idp_uri
      end
  
      def authorize_uri
        URI.join(@base_oauth_uri, AUTHORIZE_PATH).to_s
      end
  
      def token_uri
        URI.join(@base_oauth_uri, TOKEN_PATH).to_s
      end
  
      def login_uri(app_client_id, redirect_uri)
        path = "%s?response_type=code&client_id=%s&redirect_uri=%s" %
          [LOGIN_PATH, app_client_id, redirect_uri]
        # URI.join(@base_oauth_uri, path).to_s
        "https://healome-app-dev.auth.ap-south-1.amazoncognito.com/login?client_id=3ok0l1f9a8hempp5524fc4pfjv&response_type=code&scope=aws.cognito.signin.user.admin+email+openid+phone+profile&redirect_uri=http://localhost:3000/auth/sign_in"
      end
  
      def logout_uri(app_client_id, redirect_uri)
        path = "%s?response_type=code&client_id=%s&logout_uri=%s" %
          [LOGOUT_PATH, app_client_id, redirect_uri]
        URI.join(@base_oauth_uri, path).to_s
      end
  
      def signup_uri(app_client_id, redirect_uri)
        path = "%s?response_type=code&client_id=%s&redirect_uri=%s" %
          [SIGNUP_PATH, app_client_id, redirect_uri]
        # URI.join(@base_oauth_uri, path).to_s
        "https://healome-app-dev.auth.ap-south-1.amazoncognito.com/signup?client_id=3ok0l1f9a8hempp5524fc4pfjv&response_type=code&scope=aws.cognito.signin.user.admin+email+openid+phone+profile&redirect_uri=http://localhost:3000/auth/sign_out"
      end
    end
  end
  