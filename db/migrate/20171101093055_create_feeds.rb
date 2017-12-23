class CreateFeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :feeds do |t|
      t.integer :user_id
      t.integer :source_id
      t.string :feed_type
      t.string :deep_link

      t.timestamps
    end
  end
end
