class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true

  has_many :decks
  has_many :cards

  def get_decks
    decks = Deck.all
  end
end
