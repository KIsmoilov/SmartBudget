class AccountRecord < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_and_belongs_to_many :groups, dependent: :destroy

  validates :name, presence: true, length: { in: 4..250 }
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
