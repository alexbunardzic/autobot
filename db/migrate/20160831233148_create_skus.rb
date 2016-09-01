class CreateSkus < ActiveRecord::Migration
  def change
    create_table :skus do |t|
      t.integer :brand_id
      t.string :name
      t.text :description
      t.integer :quantity, :default => 1
      t.string :color
      t.decimal :weight, precision: 8, scale: 2
      t.decimal :width, precision: 8, scale: 2
      t.decimal :height, precision: 8, scale: 2
      t.decimal  :price, precision: 8, scale: 2
      t.string :material
      t.text :other_attributes
      t.boolean :active, :default => true

      t.timestamps null: false
    end

    add_index :skus, :brand_id
    add_index :skus, :name
  end
end
