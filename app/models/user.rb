class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true

  has_many :decks, dependent: :destroy
  has_many :cards, dependent: :destroy

  def get_decks
    decks = Deck.all
  end
end
