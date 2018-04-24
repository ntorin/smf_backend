class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.integer :group_id
      t.integer :user_id
      t.string :title
      t.string :topic_type
      t.string :preview

      t.boolean :is_pinned, default: false
      t.boolean :is_locked, default: false
      t.boolean :is_anonymous, default: false
      t.boolean :is_nsfw, default: false

      t.string :tags
      t.integer :post_count, default: 0
      t.datetime :last_post_date

      t.timestamps
    end
  end
end
