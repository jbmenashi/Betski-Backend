class OddSerializer < ActiveModel::Serializer
  attributes :id, :line, :home_under, :away_over
  belongs_to :game
end
