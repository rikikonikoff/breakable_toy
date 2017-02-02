module OmniauthMacros
  def mock_auth
    OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
      provider: 'google_oauth2',
      uid: '123545',
      info: {
        name: 'Purple People Eater',
        email: 'purplepeopleeater@gmail.com'
      }
    })
  end

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
    request.env['omniauth.env'] = OmniAuth.config.mock_auth[:google]
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
end
