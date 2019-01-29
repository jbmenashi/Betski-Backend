class BetSerializer < ActiveModel::Serializer
  attributes :id, :multiplier
  belongs_to :game
  belongs_to :ticket
end
