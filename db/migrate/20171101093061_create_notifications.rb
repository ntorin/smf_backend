class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.string :notification_type
      t.text :description
      t.boolean :is_seen
      t.string :goto_id

      t.timestamps
    end
  end
end
