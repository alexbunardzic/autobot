class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :intent_id
      t.text :reply
      t.integer :upvotes, :default => 0
      t.integer :downvotes, :default => 0
      t.boolean :automatic, :default => false
      t.boolean :active, :default => true

      t.timestamps null: false
    end

    add_index :answers, [:intent_id, :upvotes]
    add_index :answers, :automatic
    add_index :answers, :active
  end
end
