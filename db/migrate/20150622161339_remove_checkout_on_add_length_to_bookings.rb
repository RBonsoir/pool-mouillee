class RemoveCheckoutOnAddLengthToBookings < ActiveRecord::Migration
  def change
    remove_column :bookings, :checkout_on, :date
    add_column :bookings, :length, :string
  end
end
