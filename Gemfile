source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '3.2.12'

# Using postgresql on production for heroku
gem 'pg', :group => :production

# to avoid errors on heroku
gem 'rails_12factor', group: :production


# some useful gems
gem 'strip_attributes'
gem "dynamic_form"
gem 'devise'
gem 'fuzzily'

# Issues with recaptcha with initializer, assets:precompile
# gem 'recaptcha', :require => "recaptcha/rails"

# gem 'client_side_validations'

# nested resources
gem 'nested_scaffold'

#TODO check these gems
# gem "therubyracer"

# Use SCSS for stylesheets - setting exact version for compatibility with Heroku
# gem 'sass-rails', '3.1.5'
# gem 'bootstrap-sass'

# changed font-awesome-sass to font-awesome-rails for heroku
gem 'font-awesome-rails'

gem 'cancan'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# NOT Using it for now
# Use CoffeeScript for .js.coffee assets and views
# gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# for accessing google drive
gem 'google_drive'

# group :doc do
#   # bundle exec rake doc:rails generates the API under doc/api.
#   gem 'sdoc', require: false
# end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]



group :development do
	gem 'mysql2'
	gem 'pry'
	gem 'pry-remote'
	gem 'pry-stack_explorer'
	gem 'pry-debugger'
end

# As adviced on heroku
ruby '1.9.3'

