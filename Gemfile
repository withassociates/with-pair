ruby '2.0.0'

source 'https://rubygems.org'

gem 'rails'      , '~> 4.0.1'
gem 'pg'         , '~> 0.17.0'
gem 'sass-rails' , '~> 4.0.0'
gem 'uglifier'   , '~> 2.3.1'
gem 'unicorn'    , '~> 4.7.0'
gem 'highline'   , '~> 1.6.0' , require: false

group :production do
  gem 'rails_12factor', '~> 0.0.2'
end

group :development do
  gem 'foreman', '~> 0.63.0', require: false
  gem 'guard-rspec', '~> 4.0.4', require: false
  gem 'spork-rails', '~> 4.0.0', require: false
end

group :development, :test do
  gem 'pry-rails', '~> 0.3.2'
  gem 'rb-fsevent', '~> 0.9.3'
end

group :test do
  gem 'capybara', '~> 2.1.0'
  gem 'rspec-rails', '~> 2.14.0'
  gem 'turnip', '~> 1.1.0'
end
