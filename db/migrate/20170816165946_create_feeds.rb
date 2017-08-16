class CreateFeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :feeds do |t|
      t.integer :user_id
      t.integer :feed_type
      t.integer :goto_id

      t.timestamps
    end
  end
end
