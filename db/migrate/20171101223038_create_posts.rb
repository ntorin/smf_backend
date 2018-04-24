class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.integer :group_id
      t.integer :topic_id
      t.integer :user_id
      t.text :content
      t.integer :likes, default: 0
      t.integer :dislikes, default: 0

      t.boolean :is_op
      t.boolean :is_anonymous

      t.datetime :edit_date
      t.timestamps
    end
  end
end