source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '4.0.0'

gem 'activeadmin', github: 'gregbell/active_admin'
gem 'active_admin_editor'
gem 'aws-sdk'
gem 'coffee-rails', '~> 4.0.0'
gem 'decent_exposure'
gem 'devise'
gem 'draper'
gem 'haml-rails'
gem 'hashie'
gem 'jbuilder', '~> 1.2'
gem 'jquery-rails'
gem 'just-datetime-picker'
gem 'linkedin-scraper'
gem 'paperclip'
gem 'pg'
gem 's3'
gem 'sass-rails', '~> 4.0.0'
gem 'turbolinks'
gem 'uglifier', '>= 1.3.0'
gem 'validates_timeliness'
gem 'validates_truthiness'

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
  gem 'timecop'
end

group :doc do
  gem 'sdoc', require: false
end
