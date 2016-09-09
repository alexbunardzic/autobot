class CreateContexts < ActiveRecord::Migration
  def change
    create_table :contexts do |t|
      t.integer :context_category_id
      t.string :name
      t.text :description
      t.boolean :active, :default => true

      t.timestamps null: false
    end

    add_index :contexts, [:context_category_id, :name], unique: true
  end
end
