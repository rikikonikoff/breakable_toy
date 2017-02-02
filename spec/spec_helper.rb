require 'coveralls'
require 'capybara/poltergeist'
require 'omniauth'
require 'omniauth-google-oauth2'

OmniAuth.config.test_mode = true

def sign_in_user(uid = '123545')
  OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
  provider: 'google_oauth2',
  uid: uid,
  info: {
    name: 'Purple People Eater',
    email: 'purplepeopleeater@gmail.com'
    }
  })
  visit('/auth/google_oauth2?session_type=user')
end

def sign_in_provider(uid = '123545')
  OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
  provider: 'google_oauth2',
  uid: uid,
  info: {
    name: 'Purple People Eater',
    email: 'purplepeopleeater@gmail.com'
    }
  })
  visit('/auth/google_oauth2?session_type=provider')
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.before(:each) do
    OmniAuth.config.mock_auth[:google_oauth2] = nil
  end

  # config.before(:suite) do
  #   DatabaseCleaner.clean_with(:truncation)
  # end
  #
  # config.before(:each) do
  #   DatabaseCleaner.strategy = :transaction
  # end
end
