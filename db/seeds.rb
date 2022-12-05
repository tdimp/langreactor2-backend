user_1 = User.create(username: "testuser", password_digest: BCrypt::Password.create("password"), primary_language: "English")
user_2 = User.create(username: "user2", password_digest: BCrypt::Password.create("password"), primary_language: "Spanish")

deck_1 = user_1.decks.create(name: "Spanish Deck")
deck_2 = user_1.decks.create(name: "German Deck")
deck_3 = user_2.decks.create(name: "English Deck")

deck_1.cards.create!(foreign_language: "Spanish", primary_lang_txt: "English Test", foreign_lang_txt: "Prueba de Español", img_url: "https://istvbox.com/wp-content/uploads/2018/11/test_356816.png", user_id: 1)
deck_1.cards.create!(foreign_language: "Spanish", primary_lang_txt: "Test", foreign_lang_txt: "Prueba de Español", img_url: "https://istvbox.com/wp-content/uploads/2018/11/test_356816.png", user_id: 1)
deck_2.cards.create!(foreign_language: "German", primary_lang_txt: "German Test", foreign_lang_txt: "Test", img_url: "https://istvbox.com/wp-content/uploads/2018/11/test_356816.png", user_id: 1)
deck_3.cards.create!(foreign_language: "English", primary_lang_txt: "Deutschland", foreign_lang_txt: "Germany", img_url: "https://istvbox.com/wp-content/uploads/2018/11/test_356816.png", user_id: 2)
deck_3.cards.create!(foreign_language: "English", primary_lang_txt: "The car", foreign_lang_txt: "Das Auto", img_url: "https://istvbox.com/wp-content/uploads/2018/11/test_356816.png", user_id: 2)

join_card = deck_1.cards.create!(foreign_language: "Test", primary_lang_txt: "Join Test", foreign_lang_txt: "TEST TEST TEST", img_url: "https://istvbox.com/wp-content/uploads/2018/11/test_356816.png", user_id: 1)
deck_2.cards << join_card
