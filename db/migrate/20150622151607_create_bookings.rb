class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :user, index: true, foreign_key: true
      t.references :pool, index: true, foreign_key: true
      t.date :checkin_on
      t.date :checkout_on
      t.string :status

      t.timestamps null: false
    end
  end
end
