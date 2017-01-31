class AddEmailToProviders < ActiveRecord::Migration[5.0]
  def change
    add_column :providers, :email, :string, null: false
  end
end
