class CreateConversationMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :conversation_messages do |t|
      t.integer :conversation_id
      t.integer :user_id
      t.text :message

      t.timestamps
    end
  end
end
