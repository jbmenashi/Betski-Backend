class BetSerializer < ActiveModel::Serializer
  attributes :id, :multiplier, :team, :variety, :line, :odds
  belongs_to :game
  belongs_to :ticket
end
