# frozen_string_literal: true
require 'dotenv'
require 'httparty'
require 'base64'
require 'json'

Dotenv.load('.env.local')

@user = "#{ENV['BITBUCKET_USERNAME']}:#{ENV['BITBUCKET_APP_PASSWORD']}"
@basic_token = Base64.strict_encode64(@user)

@headers = {
  'Authorization': "Basic #{@basic_token}"
}

def list_repos(url)
  response = JSON.parse(HTTParty.get(url, headers: @headers).body)

  repositories = response['values']

  repositories.each do |repo|
    puts repo['slug']
  end

  list_repos(response['next']) if response.key?('next')
end

list_repos('https://api.bitbucket.org/2.0/repositories/econverse-ag?pagelen=100') if __FILE__ == $PROGRAM_NAME
