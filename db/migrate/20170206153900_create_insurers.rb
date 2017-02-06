class CreateInsurers < ActiveRecord::Migration[5.0]
  def change
    create_table :insurers do |t|
      t.string :company
      t.string :plan
    end
  end
end
