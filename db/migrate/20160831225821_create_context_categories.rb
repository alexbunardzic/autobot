class CreateContextCategories < ActiveRecord::Migration
  def change
    create_table :context_categories do |t|
      t.string :name
      t.text :description
      t.boolean :active, :default => true

      t.timestamps null: false
    end

    add_index :context_categories, :name
  end
end
