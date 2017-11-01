class CreateConversationUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :conversation_users do |t|
      t.integer :conversation_id
      t.integer :user_id
      t.boolean :is_admin

      t.timestamps
    end
  end
end
