source 'https://rubygems.org/'
ruby '2.3.1'

gem 'pg', '~> 0.18'
gem 'rails', '~> 5.0.0'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'jquery-rails'
gem 'uglifier', '>= 1.3.0'
gem 'gmail'
gem 'omniauth'
gem 'active_model_serializers'
gem 'omniauth-google-oauth2'
gem 'bootstrap'
gem 'validates_email_format_of'
gem 'sendgrid'
gem 'sprockets-rails'

group :test do
  gem 'coveralls', require: false
  gem "simplecov"
  gem "codeclimate-test-reporter", "~> 1.0.0"
  gem 'database_cleaner'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
  gem 'capybara'
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'launchy', require: false
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.5'
  gem 'shoulda'
  gem 'poltergeist'
  gem 'valid_attribute'
end

group :production do
  gem 'rails_12factor'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.3.3'
end
