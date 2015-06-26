class AddColumnNewNotToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :new_not, :boolean

  end
end
