class CreateProviders < ActiveRecord::Migration[5.0]
  def change
    create_table :providers do |t|
      t.string :name, null: false
      t.string :work_address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip, null: false
      t.text :bio
      t.string :profile_url

      t.string :provider, default: "google"
      t.string :uid
      t.string :username
      t.string :oauth_token
      t.datetime :oauth_expires_at
    end
  end
end
