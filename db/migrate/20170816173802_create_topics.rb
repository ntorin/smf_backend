class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.integer :user_id
      t.integer :topic_type
      t.string :name

      t.timestamps
    end
  end
end
