# frozen_string_literal: true
require 'dotenv'
require 'bitbucket_rest_api'

Dotenv.load('.env.local')

bitbucket = BitBucket.new do |config|
  config.client_id = ENV['BITBUCKET_KEY']
  config.client_secret = ENV['BITBUCKET_KEY']
end

bitbucket.repos.list do |repo|
  puts repo.name
end
