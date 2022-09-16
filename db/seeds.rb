User.create(username: "testuser", password_digest: BCrypt::Password.create("password"), primary_language: "English")
User.create(username: "user2", password_digest: BCrypt::Password.create("password"), primary_language: "Spanish")

Deck.create(name: "Spanish Deck", user_id: 1)
Deck.create(name: "German Deck", user_id: 1)
Deck.create(name: "English Deck", user_id: 2)

Card.create!(foreign_language: "Spanish", primary_lang_txt: "English Test", foreign_lang_txt: "Prueba de Español", img_url: "test")
Card.create!(foreign_language: "Spanish", primary_lang_txt: "Test", foreign_lang_txt: "Prueba de Español", img_url: "test")

DeckCard.create(deck_id: 1, card_id: 1)
DeckCard.create(deck_id: 1, card_id: 2)