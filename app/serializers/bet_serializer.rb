class BetSerializer < ActiveModel::Serializer
  attributes :id, :multiplier, :team, :variety, :line, :odds, :away, :home
  belongs_to :game
  belongs_to :ticket
end
