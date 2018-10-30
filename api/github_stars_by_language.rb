require 'net/http'
require 'uri'
require 'json'

def get_user_info(user)
  uri = URI.parse("https://api.github.com/users/#{user}/starred")
  response = Net::HTTP.get_response(uri)
  if response.code == '200'
    result = JSON.parse(response.body)
    return result
  else
    puts "Error retrieving: #{user}"
  end
end

def filter_response(filter)
  filtered = []
  arr = get_user_info('andrewmcodes')
  arr.each do |x|
    filtered << x[filter]
  end
  filtered.uniq
end

def language_filter(language)
  languages = filter_response(language)

  languages.each do |x|
    puts x
    puts '========='
    get_user_info('andrewmcodes').each do |y|
      puts y['name'] if y['language'] == x
    end
  end
end

language_filter('language')
