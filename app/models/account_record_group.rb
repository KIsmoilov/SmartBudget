class AccountRecordGroup < ApplicationRecord
  belongs_to :account_record
  belongs_to :group
end
