class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password_digest, :primary_language
end
