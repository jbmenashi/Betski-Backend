class TicketSerializer < ActiveModel::Serializer
  attributes :id, :wager, :payout
  belongs_to :user
  has_many :bets
end
