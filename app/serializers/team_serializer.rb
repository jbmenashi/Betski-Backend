class TeamSerializer < ActiveModel::Serializer
  attributes :id, :city, :nickname, :win_loss, :home_win_loss, :away_win_loss, :points_for, :points_against, :streak
  belongs_to :game
end
