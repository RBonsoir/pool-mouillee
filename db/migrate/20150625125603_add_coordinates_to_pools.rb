class AddCoordinatesToPools < ActiveRecord::Migration
  def change
    add_column :pools, :latitude, :float
    add_column :pools, :longitude, :float
  end
end
