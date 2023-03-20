class CreateAccountRecordsGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :account_records_groups do |t|
      t.references :account_record, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
