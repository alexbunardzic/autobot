class CreateCategorizedMessages < ActiveRecord::Migration
  def change
    create_table :categorized_messages do |t|
      t.integer :intent_id
      t.integer :message_id

      t.timestamps null: false
    end

    add_index :categorized_messages, [:intent_id, :message_id]
  end
end
