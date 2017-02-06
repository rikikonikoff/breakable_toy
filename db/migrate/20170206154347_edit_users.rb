class EditUsers < ActiveRecord::Migration[5.0]
  def up
    remove_column :users, :insurance_provider
  end

  def down
    add_column :users, :insurance_provider, :string
  end
end
