module ProviderSignInHelper
  def provider_login_google(email)
    visit login_provider_path(:google_oauth2)
    fill_in "Enter your email", with: "emailexample@example.com"
    click "Next"
    fill_in :password, with: "password"
    click "Sign In"
  end
end
