class User < ApplicationRecord
  has_secure_password

  has_many :decks

  def get_decks
    decks = Deck.all
  end
end
