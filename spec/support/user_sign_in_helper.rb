module UserSignInHelper
  def user_login_google(password = "password")
    visit login_user_path(:google_oauth2)
    fill_in :password, with: password
    click "Sign In"
  end
end
