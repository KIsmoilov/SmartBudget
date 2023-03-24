class AddUserToOperations < ActiveRecord::Migration[7.0]
  def change
    add_reference :operations, :user, null: false, foreign_key: true
  end
end
