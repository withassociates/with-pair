ruby '2.1.1'

source 'https://rubygems.org'

gem 'rails'      , '~> 4.1.0'
gem 'pg'         , '~> 0.17.0'
gem 'sass-rails' , '~> 4.0.0'
gem 'uglifier'   , '~> 2.5.0'
gem 'unicorn'    , '~> 4.8.0'
gem 'highline'   , '~> 1.6.0' , require: false
gem 'chronic'    , '~> 0.10.0', require: false
gem 'bourbon'

group :production do
  gem 'rails_12factor', '~> 0.0.2'
end

group :development do
  gem 'foreman', '~> 0.63.0', require: false
  gem 'guard-rspec', '~> 4.2.0', require: false
  gem 'spring-commands-rspec', '~> 1.0.0', require: false
end

group :development, :test do
  gem 'pry-rails', '~> 0.3.0'
end

group :test do
  gem 'capybara', '~> 2.2.0'
  gem 'rspec-rails', '~> 2.14.0'
  gem 'turnip', '~> 1.2.0'
end
