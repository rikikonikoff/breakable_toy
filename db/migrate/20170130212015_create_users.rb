class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :insurance_provider
      t.string :address
      t.string :city
      t.string :state
      t.string :zip

      t.string :provider, default: "google"
      t.string :uid
      t.string :username
      t.string :email
      t.string :oauth_token
      t.datetime :oauth_expires_at
    end
  end
end
