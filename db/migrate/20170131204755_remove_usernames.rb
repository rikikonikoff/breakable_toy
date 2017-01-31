class RemoveUsernames < ActiveRecord::Migration[5.0]
  def up
    remove_column :providers, :username
    remove_column :users, :username
  end

  def down
    add_column :providers, :username, :string
    add_column :users, :username, :string
  end
end
