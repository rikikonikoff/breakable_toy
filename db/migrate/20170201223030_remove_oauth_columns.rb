class RemoveOauthColumns < ActiveRecord::Migration[5.0]
  def up
    remove_column :providers, :oauth_token
    remove_column :providers, :oauth_expires_at
    remove_column :users, :oauth_token
    remove_column :users, :oauth_expires_at
  end

  def down
    add_column :providers, :oauth_token, :string
    add_column :providers, :oauth_expires_at, :datetime
    add_column :users, :oauth_token, :string
    add_column :users, :oauth_expires_at, :datetime
  end
end
