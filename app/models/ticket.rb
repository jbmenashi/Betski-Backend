class Ticket < ApplicationRecord
  belongs_to :user
  has_many :bets
  has_many :games, through: :bets
end
