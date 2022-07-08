require 'cognito_jwt_keys'
require 'cognito_urls'

if !ENV['AWS_COGNITO_DOMAIN'].blank?
  CognitoUrls.init(ENV['AWS_COGNITO_DOMAIN'],
                   ENV['AWS_COGNITO_REGION_1'])

    #AWS_COGNITO_DOMAIN: healomef3b848cc-f3b848cc-dev
    #AWS_COGNITO_REGION_1: ap-south-1
    #AWS_COGNITO_REGION_2: us-east-1
    #AWS_COGNITO_POOL_ID: ap-south-1_KNEbM0c4t

  CognitoJwtKeysProvider.init(ENV['AWS_COGNITO_POOL_ID'])
else
  puts "Skipping Cognito initialization"
end
