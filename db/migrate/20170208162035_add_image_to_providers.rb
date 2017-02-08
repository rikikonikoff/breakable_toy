class AddImageToProviders < ActiveRecord::Migration[5.0]
  def change
    add_column :providers, :avatar, :string
  end
end
