# frozen_string_literal: true
require 'dotenv'
require 'httparty'
require 'base64'

Dotenv.load('.env.local')

@user = "#{ENV['BITBUCKET_USERNAME']}:#{ENV['BITBUCKET_APP_PASSWORD']}"
@basic_token = Base64.strict_encode64(@user)

@headers = {
  'Authorization': "Basic #{@basic_token}"
}

def list_repos
  url = 'https://api.bitbucket.org/2.0/repositories/econverse-ag'

  response = HTTParty.get(url, headers: @headers)

  puts response
end

list_repos if __FILE__ == $PROGRAM_NAME
