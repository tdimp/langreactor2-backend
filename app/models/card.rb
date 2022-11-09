class Card < ApplicationRecord
  has_many :deck_cards, dependent: :destroy
  has_many :decks, through: :deck_cards

  belongs_to :user
  
end
