class AddColumnGeoToPools < ActiveRecord::Migration
  def change
    add_column :pools, :street_number, :string
    add_column :pools, :route, :string
    add_column :pools, :locality, :string
    add_column :pools, :administrative_area_level_1, :string
    add_column :pools, :postal_code, :string
    add_column :pools, :country, :string
  end
end
