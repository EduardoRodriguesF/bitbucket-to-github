# frozen_string_literal: true
require 'dotenv'
require 'httparty'
require 'base64'
require 'json'

Dotenv.load("#{__dir__}/.env.local")

@user = "#{ENV['BITBUCKET_USERNAME']}:#{ENV['BITBUCKET_APP_PASSWORD']}"
@basic_token = Base64.strict_encode64(@user)
@workspace = ENV['BITBUCKET_WORKSPACE']

@headers = {
  'Authorization': "Basic #{@basic_token}"
}

def list_repos(url)
  response = JSON.parse(HTTParty.get(url, headers: @headers).body)

  repositories = response['values']

  repositories.each do |repo|
    continue if File.readlines("#{__dir__}/.repoignore").grep(repo).any?

    puts repo['slug']
  end

  list_repos(response['next']) if response.key?('next')
end

list_repos("https://api.bitbucket.org/2.0/repositories/#{@workspace}?pagelen=100") if __FILE__ == $PROGRAM_NAME
