class CreateAnonymousProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :anonymous_profiles do |t|
      t.string :user_id
      t.string :name
      t.string :name_color

      t.timestamps
    end
  end
end
