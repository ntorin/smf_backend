class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.integer :group_id
      t.integer :creator_id
      t.string :title
      t.integer :topic_type
      t.datetime :last_post_date

      t.timestamps
    end
  end
end
