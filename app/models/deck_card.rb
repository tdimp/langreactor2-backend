class DeckCard < ApplicationRecord
  belongs_to :deck, dependent: :destroy
  belongs_to :card
end
