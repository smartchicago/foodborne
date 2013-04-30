source 'https://rubygems.org'

# Rails
gem 'rails', '3.2.13'

# ActiveAdmin
gem 'activeadmin'
gem "meta_search", '>= 1.1.0.pre'

# jQuery
gem 'jquery-rails'
gem 'jquery-ui-rails'

# Haml
gem 'haml-rails'

# Simple Form
gem 'simple_form'

# Twitter
gem 'twitter'

# Geocoder
gem 'geocoder'

# Httparty
gem 'httparty'

# MongoDB
gem 'mongo'
gem 'bson_ext'

# High Voltage, static pages
gem 'high_voltage'

# use unicorn as app server
gem 'unicorn'

# New relic -- application monitoring
gem 'newrelic_rpm'

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'shoulda-context', '~> 1.0.2'
  gem 'shoulda-matchers', '~> 1.4.2'
end

group :test do
  gem 'faker'
  gem 'capybara'
  gem 'guard-rspec'
  gem 'launchy'
end

group :production do
  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  # gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
end