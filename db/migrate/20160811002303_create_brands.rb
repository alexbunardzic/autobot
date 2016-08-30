class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.integer :product_id
      t.string :name
      t.text :description
      t.boolean :active, :default => true

      t.timestamps null: false
    end

    add_index :brands, :name, unique: true
  end
end
