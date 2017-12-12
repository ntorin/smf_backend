class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.integer :group_id
      t.integer :creator_id
      t.string :title
      t.integer :topic_type
      t.boolean :is_anonymous
      t.boolean :is_pinned
      t.boolean :is_locked
      t.string :tags
      t.integer :post_count
      t.datetime :last_post_date

      t.timestamps
    end
  end
end
