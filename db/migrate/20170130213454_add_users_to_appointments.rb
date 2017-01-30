class AddUsersToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :user_id, :integer
    add_index :appointments, :user_id
  end
end
