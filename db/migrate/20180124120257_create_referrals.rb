class CreateReferrals < ActiveRecord::Migration[5.0]
  def change
    create_table :referrals do |t|
      t.integer :user_id
      t.integer :referrer_id

      t.timestamps
    end
  end
end
