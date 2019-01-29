class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :balance
  has_many: :tickets
end
