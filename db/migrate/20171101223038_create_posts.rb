class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.integer :topic_id
      t.integer :creator_id
      t.text :content
      t.integer :likes
      t.integer :dislikes
      t.boolean :is_op
      t.boolean :is_anonymous
      t.datetime :edit_date

      t.timestamps
    end
  end
end
c