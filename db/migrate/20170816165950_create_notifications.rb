class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :notification_type
      t.text :message
      t.integer :goto_id
      t.boolean :is_seen

      t.timestamps
    end
  end
end
