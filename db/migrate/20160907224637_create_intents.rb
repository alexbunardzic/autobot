class CreateIntents < ActiveRecord::Migration
  def change
    create_table :intents do |t|
      t.integer :context_id
      t.string :name
      t.text :description
      t.boolean :active, :default => true

      t.timestamps null: false
    end

    add_index :intents, [:context_id, :name], unique: true
  end
end
