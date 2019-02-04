class TicketSerializer < ActiveModel::Serializer
  attributes :id, :wager, :payout, :submitted, :closed, :result
  belongs_to :user
  has_many :bets
end
