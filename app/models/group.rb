class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :account_records, dependent: :destroy

  validates :name, presence: true, length: { in: 4..250 }
  validates :icon, presence: true, length: { in: 4..250 }
end
