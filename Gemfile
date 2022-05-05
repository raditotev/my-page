source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.2.3'
#Bootstrap
gem 'bootstrap-sass'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'jquery-ui-rails'
gem 'turbolinks'
gem 'jquery-turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# Authenication
gem 'devise'
#Image upload
gem "paperclip"
# Amazon Web Services
gem 'aws-sdk'
# WYSIWYG
gem "ckeditor", '4.1.3'
#Styling
gem "font-awesome-rails"
#Mail generator
gem 'mail_form'
# Friendly URL
gem 'friendly_id'
# Forms
gem 'simple_form'
# Rails routes js helper
gem "js-routes"

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'pg'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'rails-controller-testing'
end

group :test do
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  gem 'sqlite3', '~> 1.3.6'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console'
  # Email preview in dvelopment
  gem "letter_opener"

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'rubocop-rspec'
  gem 'rubocop-performance'
end

group :production do
  # Use postgresql as the database for Active Record
  gem 'pg'
  # Webserver
  gem 'puma'
end

ruby "2.5.1"
