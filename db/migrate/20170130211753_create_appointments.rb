class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.belongs_to :provider
      t.boolean :booked?
      t.date :date
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
