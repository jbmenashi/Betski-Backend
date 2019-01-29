class User < ApplicationRecord
  has_many :tickets
  has_many :bets, through: :tickets
end
