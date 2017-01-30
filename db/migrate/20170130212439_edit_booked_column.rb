class EditBookedColumn < ActiveRecord::Migration[5.0]
  def change
    change_column_default :appointments, :booked?, from: nil, to: false
    change_column_null :appointments, :booked?, false
  end
end
