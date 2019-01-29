class Bet < ApplicationRecord
  belongs_to :game
  belongs_to :ticket
end
