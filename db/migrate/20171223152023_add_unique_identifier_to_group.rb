class AddUniqueIdentifierToGroup < ActiveRecord::Migration[5.0]
  def change
    add_index :groups, :identifier, unique: true
  end
end
