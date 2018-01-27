class CreateGroupUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :group_users do |t|
      t.integer :group_id
      t.integer :user_id
      t.string :role, default: 'user'
      t.boolean :is_kicked, default: false
      t.boolean :is_banned, default: false

      t.timestamps
    end
  end
end
