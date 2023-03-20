class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :groups, dependent: :destroy
  has_many :account_records, foreign_key: 'author_id', dependent: :destroy

  validates :name, presence: true

  def admin?
    role == 'admin'
  end
end
