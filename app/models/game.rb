class Game < ApplicationRecord
  has_many :odds
  has_many :bets
  has_many :tickets, through: :bets
end
