class CreateCreditHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_histories do |t|
      t.integer :user_id
      t.integer :transaction
      t.text :description

      t.timestamps
    end
  end
end
