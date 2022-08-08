#require 'cognito_jwt_keys'
#require 'cognito_urls'
#require 'stripe.rb?'
require "stripe"

key = ENV["stripe_publishable_key"]
secret = ENV["stripe_api_key"]
