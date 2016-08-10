class CreateProductTypes < ActiveRecord::Migration
  def change
    create_table :product_types do |t|
      t.string :name
      t.text :description
      t.boolean :active

      t.timestamps null: false
    end

    add_index :product_types, :name, unique: true
  end
end
