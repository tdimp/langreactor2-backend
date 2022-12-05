class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :primary_language

  has_many :cards
end
