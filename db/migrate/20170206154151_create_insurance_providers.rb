class CreateInsuranceProviders < ActiveRecord::Migration[5.0]
  def change
    create_table :insurance_providers do |t|
      t.belongs_to :insurer
      t.belongs_to :provider, optional: true
      t.belongs_to :user, optional: true
    end
  end
end
