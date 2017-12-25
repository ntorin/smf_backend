class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.string :name
      t.text :description
      t.boolean :is_group, default: false
      t.integer :member_count, default: 0
      t.integer :message_count, default: 0
      t.text :last_message
      t.datetime :last_message_date

      t.timestamps
    end
  end
end
