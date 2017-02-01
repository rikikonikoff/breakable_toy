# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'

# Add additional requires below this line. Rails is not loaded until this point!

# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

OmniAuth.config.test_mode = true
omniauth_hash = {
  provider: 'google_oauth2',
  uid: '123545',
  info: {
    name: 'Purple People Eater',
    email: 'purplepeopleeater@gmail.com'
  },
  credentials: {
    token:
    "ya29.GlzkA7eqFoceHF1yIDT_IvOdNQa684fjj8F5xsd7XntsKXTP2W0YF5KFIpEaIaUsvDqnwGihjPZuorVu6z9MQ9BMqBq0mxzPBVMN4VYUXqvY3jt1MUOgjyTA5Hv5gA",
    expires_at: 1354920555
  }
}
OmniAuth.config.add_mock(:google_oath2, omniauth_hash)

# Checks for pending migration and applies them before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end
require "capybara/rails"
require "valid_attribute"

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
