class User < ApplicationRecord
  has_secure_password # password setter / encrypt_password / authenticate
end
