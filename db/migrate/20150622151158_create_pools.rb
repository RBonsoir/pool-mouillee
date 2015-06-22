class CreatePools < ActiveRecord::Migration
  def change
    create_table :pools do |t|
      t.string :title
      t.text :content
      t.string :address
      t.string :city
      t.integer :price
      t.integer :capacity
      t.boolean :availability
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
