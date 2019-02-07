class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password_digest :balance
  has_many :tickets
end
