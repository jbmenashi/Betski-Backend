class User < ApplicationRecord
  has_many :tickets
  has_many :bets, through: :tickets

  validates :username, presence: true
  validates :balance, numericality: {greater_than: -1}
end
