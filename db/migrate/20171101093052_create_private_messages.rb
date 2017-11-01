class CreatePrivateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :private_messages do |t|
      t.integer :conversation_id
      t.integer :sender_id
      t.text :message

      t.timestamps
    end
  end
end
