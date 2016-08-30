class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :product_type_id
      t.string :name
      t.text :description
      t.boolean :active, :default => true

      t.timestamps null: false
    end

    add_index :products, :name, unique: true
  end
end
