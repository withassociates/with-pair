source 'https://rubygems.org'
ruby '2.2.2'

gem 'bourbon'               , '~> 4.1.0'
gem 'chronic'               , '~> 0.10.0'
gem 'highline'              , '~> 1.6.0' , require: false
gem 'omniauth-google-oauth2', '~> 0.2.6'
gem 'pg'                    , '~> 0.18.1'
gem 'pry-rails'             , '~> 0.3.0'
gem 'rails'                 , '~> 4.2.0'
gem 'sass-rails'            , '~> 5.0.0'
gem 'uglifier'              , '~> 2.7.0'
gem 'unicorn'               , '~> 4.8.0'
gem 'skylight'

group :production do
  gem 'rails_12factor', '~> 0.0.2'
end

group :development do
  gem 'dotenv-rails'          , '~> 1.0.2'
  gem 'foreman'               , '~> 0.77.0' , require: false
  gem 'guard-rspec'           , '~> 4.5.0'  , require: false
  gem 'powder'                , '~> 0.3.0'  , require: false
  gem 'spring-commands-rspec' , '~> 1.0.0'  , require: false
  gem 'byebug'
end

group :test do
  gem 'capybara', '~> 2.4.4'
  gem 'rspec-rails', '~> 3.1.0'
  gem 'turnip', '~> 1.2.0'
  gem 'timecop', '~> 0.7.0'
end

group :development, :test do
  gem 'rake', '~> 10.4.0'
end
