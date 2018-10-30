require 'net/http'
require 'uri'
require 'json'

def get_gem_info(gem)
  uri = URI.parse("https://rubygems.org/api/v1/gems/#{gem}.json")
  response = Net::HTTP.get_response(uri)
  if response.code == '200'
    result = JSON.parse(response.body)
    return result['name'], result['info'], result['source_code_uri']
  else
    puts "Error retrieving: #{gem}"
  end
end

# %w[pronto reek danger simplecov rubocop rails_best_practices].each do |g|
#   name, info, source_uri = get_gem_info(g)
#   puts "Name: #{name}\nInfo: #{info}\nSource: #{source_uri}"
#   puts ''
# end

GEM_LIST = [
  ['CMS', %w[comfortable-mexican-sofa]],
  ['Styling/CSS/UI', %w[twitter-bootstrap-rails devise-bootstrap-views bootstrap-datepicker-rails bootstrap-rubygem autoprefixer-rails csscss kss xray-rails font-awesome-rails]],
  ['File Management', %w[paperclip]],
  ['Javascript Related', %w[webpacker webpacker-react js-routes react_on_rails]],
  ['Authentication & Authorization', %w[devise clearance omniauth-amazon omniauth-dribbble petergate devise_invitable doorkeeper ruby-saml pundit]],
  ['Documentation', %w[yard annotate_gem annotate_models]],
  ['Editors & Intellisense', %w[vscode-ruby qira]],
  ['Web Crawling', %w[spidr wombat]],
  ['CSV', %w[csvreader]],
  ['Profiling, Benchmarking, & Debugging', %w[rbspy rack-mini-profiler memory_profiler peek rails_panel better_errors oink bullet pry-rails]],
  ['Jobs', %w[sidekiq-scheduler]],
  ['Structs', %w[opt_struct]],
  ['Devops', %w[puppet docker opsworks-cookbooks chef]],
  ['Shell Scripts & CLI Tools', %w[fucking_shell_scripts tugboat thor guard tmuxinator cli-ui colorls]],
  ['Notifications', %w[rpush]],
  ['Integrations', %w[google-drive-ruby Google-Maps-for-Rails unsplash_rb]],
  ['Forms', %w[recaptcha]],
  ['Code Quality', %w[pronto reek danger simplecov rubocop rails_best_practices]],
  ['Accessibility', %w[rails-i18n]],
  ['Database', %w[pghero graphql-ruby graphql-ruby-client seed_dump ruby-pg mysql2]],
  ['Templating languages and frontend', %w[slim cells draper components haml-rails haml]],
  ['Github', %w[github-changelog-generator styleguide-git-commit-message octobox git-god]],
  ['Email', %w[postal mailcatcher]],
  ['Hacking', %w[hacker101 metasploit-framework]],
  ['Pagination', %w[pagy kaminari]],
  ['Automatiom', %w[fastlane]],
  ['Random', %w[stock_quote ancestry browser_sniffer]],
  ['Multitenancy', %w[apartment milia]],
  ['Analytics', %w[ahoy]],
  ['Secrets & Keys', %w[figaro]],
  ['Search & Filter', %w[searchkick filterrific]],
  ['Payment', %w[stripe-ruby]]
]

GEM_LIST.each do |category, gems|
  puts ''
  puts "## #{category}"
  gems.each do |x|
    puts "1. #{x}"
  end
end
