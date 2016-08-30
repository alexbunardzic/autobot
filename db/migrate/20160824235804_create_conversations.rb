class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.integer :user_id
      t.string :user_says
      t.string :bot_says
      t.string :next_step

      t.timestamps null: false
    end

    add_index :conversations, :user_id
  end
end
