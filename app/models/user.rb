class User < ApplicationRecord
  has_many :tickets
  has_many :bets, through: :tickets
  has_secure_password


  validates :username, presence: true
  validates :username, uniqueness: { case_sensitive: false}
  validates :balance, numericality: {greater_than: -1}
end
