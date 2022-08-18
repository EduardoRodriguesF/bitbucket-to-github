require 'httparty'
require 'dotenv'
require 'json'

Dotenv.load("#{__dir__}/.env.local")

@repository_name = ARGV[0]

@headers = {
  'Accept': 'application/vnd.github+json',
  'Authorization': "token #{ENV['GITHUB_PERSONAL_TOKEN']}"
}

response = HTTParty.get(
  "https://api.github.com/repos/EconverseAG/#{@repository_name}",
  headers: @headers
)

response_body = JSON.parse(response.body)

if response_body['message'] != 'Not Found'
  puts "repository #{@repository_name} already exists!"
else
  exit 1
end
