class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :primary_language
end
