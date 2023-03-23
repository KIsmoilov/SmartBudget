class Group < ApplicationRecord
  belongs_to :user
  has_many :group_operations, dependent: :destroy
  has_many :operations, through: :group_operations

  validates :name, presence: true, length: { in: 3..250 }
  validates :icon, presence: true, length: { in: 3..250 }

  def total_amount
    operations.sum(:amount)
  end

  def recent_exchanges
    operations.order(created_at: :desc)
  end
end
