class TicketSerializer < ActiveModel::Serializer
  attributes :id, :wager, :payout, :submitted, :closed
  belongs_to :user
  has_many :bets
end
