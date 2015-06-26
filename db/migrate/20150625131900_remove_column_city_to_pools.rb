class RemoveColumnCityToPools < ActiveRecord::Migration
  def change
    remove_column :pools, :city, :string
  end
end
