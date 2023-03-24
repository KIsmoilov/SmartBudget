class Operation < ApplicationRecord
  belongs_to :user

  has_many :group_operations, dependent: :destroy
  has_many :groups, through: :group_operations

  validates :name, :amount, presence: true, length: { in: 1..100 }
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
  validates :icon,
            format: { with: /\.(gif|jpg|png|svg|ico|jpeg)\Z/i,
                      message: 'must be a URL for GIF, SVG, JPG, PNG, ICO or Jpeg image.' }
end
