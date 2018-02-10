class CreateConversationUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :conversation_users do |t|
      t.integer :conversation_id
      t.integer :user_id
      t.string :role, default: 'user'
      t.boolean :is_muted, default: false
      t.integer :unreads, default: 0

      t.timestamps
    end
  end
end
