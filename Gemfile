source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '4.0.0'

gem 'activeadmin', github: 'gregbell/active_admin'
gem 'coffee-rails', '~> 4.0.0'
gem 'decent_exposure'
gem 'devise'
gem 'draper'
gem 'haml-rails'
gem 'jbuilder', '~> 1.2'
gem 'jquery-rails'
gem 'pg'
gem 'sass-rails', '~> 4.0.0'
gem 'turbolinks'
gem 'uglifier', '>= 1.3.0'

group :staging, :production do
  gem 'rails_12factor'
end

group :test do
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'valid_attribute'
end

group :development, :test do
  gem 'better_errors'
  gem 'capybara-webkit'
  gem 'factory_girl_rails'
  gem 'jazz_hands'
  gem 'rspec-rails', '~> 2.0'
end

group :doc do
  gem 'sdoc', require: false
end
