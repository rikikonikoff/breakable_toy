class ChangeColumnNulls < ActiveRecord::Migration[5.0]
  def change
    change_column_null :providers, :work_address, true
    change_column_null :providers, :city, true
    change_column_null :providers, :state, true
    change_column_null :providers, :zip, true
  end
end
