require 'coveralls'
require 'omniauth'
require 'omniauth-google-oauth2'
require 'capybara/poltergeist'

Coveralls.wear!('rails')

Capybara.javascript_driver = :poltergeist

OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
  provider: 'google_oauth2',
  uid: '123545',
  info: {
    name: 'Purple People Eater',
    email: 'purplepeopleeater@gmail.com'
  }
})

def user_login_test
  OmniAuth.config.add_mock(:google_oauth2, {
    uid: '12345',
    info: {
      name: 'Purple People Eater',
      email: 'purplepeopleeater@gmail.com'
      }
    })
  visit '/auth/google_oauth2?session_type=user'
  binding.pry
  request.env['omniauth.env'] = OmniAuth.config.mock_auth[:google_oauth2]
  get '/auth/google_oauth2?session_type=user/callback'
end

def provider_login_test
  OmniAuth.config.add_mock(:google_oauth2, {
    uid: '12345',
    info: {
      name: 'Purple People Eater',
      email: 'purplepeopleeater@gmail.com'
      }
    })
  get '/auth/google_oauth2?session_type=provider'
  request.env['omniauth.env'] = OmniAuth.config.mock_auth[:google_oauth2]
  get '/auth/google_oauth2?session_type=provider/callback'
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  # config.before(:suite) do
  #   DatabaseCleaner.clean_with(:truncation)
  # end
  #
  # config.before(:each) do
  #   DatabaseCleaner.strategy = :transaction
  # end
end
