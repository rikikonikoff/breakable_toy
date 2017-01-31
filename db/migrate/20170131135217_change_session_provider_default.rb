class ChangeSessionProviderDefault < ActiveRecord::Migration[5.0]
  def change
    change_column_default :users, :provider, "google_oauth2"
    change_column_default :providers, :provider, "google_oauth2"
  end
end
