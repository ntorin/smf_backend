class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :group_id
      t.integer :source_id
      t.string :notification_type
      t.text :description
      t.boolean :is_seen
      t.string :deep_link

      t.timestamps
    end
  end
end
