class GameSerializer < ActiveModel::Serializer
  attributes :id, :sport, :date, :home_team, :home_logo, :away_team, :away_logo, :spread, :over_under, :home_score, :away_score
  has_many :odds
  has_many :bets
end
