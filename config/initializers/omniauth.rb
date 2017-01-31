OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"], {
    scope: ['email',
    'https://www.googleapis.com/auth/gmail.modify'],
    access_type: 'offline'
  }
end
