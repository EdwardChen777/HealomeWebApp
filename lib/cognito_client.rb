require "cognito_jwt_keys"
require "cognito_pool_tokens"
require "cognito_urls"
require 'uri'

class CognitoClient
  #don't think i can access the application.yml so need to hide the information later (client_id and pool_id)
  def initialize(params = {})
    @pool_id = params[:pool_id] || ENV['AWS_COGNITO_POOL_ID']
    @client_id = params[:client_id] || ENV['AWS_COGNITO_APP_CLIENT_ID']
    # @client_secret = params[:client_secret] || ENV['AWS_COGNITO_APP_CLIENT_SECRET']
    @redirect_uri = params[:redirect_uri]
  end

  def get_pool_tokens(authorization_code)
    params = {
      grant_type: 'authorization_code',
      code: authorization_code,
      client_id: @client_id,
      redirect_uri: 'http://localhost:3000/auth/sign_in'
    }
    # resp = Excon.get()
    resp = Excon.post('https://healome-app-dev.auth.ap-south-1.amazoncognito.com/oauth2/token',
                      # token_uri,
                      # :user => @client_id,
                      # :password => @client_secret,
                      :body => URI.encode_www_form(
                        :grant_type => 'authorization_code',
                        :code => authorization_code,
                        :client_id => '3ok0l1f9a8hempp5524fc4pfjv',
                        :redirect_uri => @redirect_uri
                      ),
                      :headers => { "Content-Type" => "application/x-www-form-urlencoded"})

    unless resp.status == 200
      Rails.logger.warn("Invalid code: #{resp.headers}: #{resp.status} : #{@redirect_uri}")
      Rails.logger.warn("Invalid code: #{authorization_code}: #{resp.body}")
      return nil
    end

    CognitoPoolTokens.new(CognitoJwtKeysProvider.keys, JSON.parse(resp.body))
  end

  # From: https://medium.com/tensult/how-to-refresh-aws-cognito-user-pool-tokens-d0e025cedd52
  def refresh_id_token(refresh_token)
    params = {
      ClientId: '3ok0l1f9a8hempp5524fc4pfjv',
      AuthFlow: 'REFRESH_TOKEN_AUTH',
      AuthParameters: {
        REFRESH_TOKEN: refresh_token,
        # SECRET_HASH: @client_secret
      }
    }

    hdrs = {
      "X-Amz-Target": "AWSCognitoIdentityProviderService.InitiateAuth",
      "Content-Type": "application/x-amz-json-1.1"
    }

    resp = Excon.post(#CognitoUrls.refresh_token_uri,
                      'https://cognito-idp.ap-south-1.amazonaws.com',
                      :headers => hdrs,
                      :body => params.to_json)
    if resp.status != 200
      return nil
    end

    json = JSON.parse(resp.body)

    # Key names are different here, so need to translate :-/
    tokens = {
      'id_token' => json['AuthenticationResult']['IdToken'],
      'access_token' => json['AuthenticationResult']['AccessToken']
    }

    CognitoPoolTokens.new(CognitoJwtKeysProvider.keys, tokens)
  end

private

  def token_uri
    CognitoUrls.token_uri
  end
end
