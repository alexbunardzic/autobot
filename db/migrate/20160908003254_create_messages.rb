class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :conversation_id
      t.text :body

      t.timestamps null: false
    end

    add_index :messages, :conversation_id
    add_index :messages, :body
  end
end
