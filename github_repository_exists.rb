require 'httparty'
require 'dotenv'
require 'json'

Dotenv.load("#{__dir__}/.env.local")

@repository_name = ARGV[0]
@organization = ENV['GITHUB_ORGANIZATION']

@headers = {
  'Accept': 'application/vnd.github+json',
  'Authorization': "token #{ENV['GITHUB_PERSONAL_TOKEN']}"
}

response = HTTParty.get(
  "https://api.github.com/repos/#{@organization}/#{@repository_name}",
  headers: @headers
)

response_body = JSON.parse(response.body)

if response_body['message'] != 'Not Found'
  puts "repository #{@repository_name} already exists!"

  File.open("#{__dir__}/.repoignore", 'a') do |file|
    file.puts @repository_name
  end
else
  exit 1
end
