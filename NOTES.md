Routes:
Home route: /decks - decks dashboard that displays a user's decks
Single deck: /decks/:id
New card form: /cards/new

Models:
User
Deck
Deck_Cards
Cards


Note on starting Postresql server: $sudo service postgresql start

La casa
The house

La camisa
The shirt

La carretera 
The highway

El caracol
The seashel


Create a custom get route that is dynamic, containing a bit of text which can be used to search either the primary or foreign language. This search should not be case sensitive and should return all the hits for any languages that contain a piece that matches the text provided in the url.
Return all the cards which contain a match in either language as json.

Create custom GET route that accepts dynamic params. The route should lead to a controller action that returns all the cards containing the params in either the
primary_lang_txt or foreign_lang_txt. Render the cards as json.

routes.rb
try GET route to cards/:params to see if route works/is available. If not, try search/:params. The route should lead to cards#search, a custom method in the cards_controller. Check to make sure the route works and the correct controller action is being hit.

cards_controller.rb
define the custom method to handle the search logic.
  Test to make sure the custom route is hitting this controller action. 
  Check that the custom dynamic params are accessible within the method using byebug or binding.pry (try accessing the params hash).

If the dynamic params are accessible via the controller action, build the search function. 
  Check to see if either primary_lang_txt or foreign_lang_txt includes the search param substring. 
    Both the search param(s) and the card attributes should be downcased so that it is not case sensitive.
  
  Iterate over all cards and shovel cards with hits into new array
    Alternatively, try filtering the Card.all array using conditions

The result should be an array containing any cards whose primary_lang_txt or foreign_lang_text contain the search param. Check if the logic is functioning using the console.

  Things to practice going forward:
1. Pseudo-coding - build action plans to help you work through challenging deliverables
2. Validation - check in on your steps and validate your ideas. This can be like checking a route is working or checking in on building a long chain of code instead of trying to write the whole thing in one sitting
3. Recognizing when you are running up against a wall and pulling back to regroup and re-articulate the problem to think of other ways to solve it.


1. Reiterate the question
2. Ask clarifying questions. If none, go right to pseudocoding
3. Draw diagram if necessary
4. Code it out / test along the way
5. Go through steps 1-3 again if necessary
6. Final test


Create custom route to find all cards created by a user
From frontend: click user's name who created the card (grab user_id, send to backend via params)


Time out how long it takes to code this out using this pseudocode: 3 minutes 32 seconds!
routes.rb
Create dynamic GET route that searches for Cards with a given username -> make sure route is available and hits the correct controller action
  username passed to backend via params -> make sure the data from frontend is coming through correctly
  cards_controller -> user_search to: cards#by_user -> verify controller action is being hit by dynamic route, try with different params to test

cards_controller.rb
  define a method to get the user object using the username from params -> user.id (find_by, where)
  define custom controller method that finds all cards whose user_id == user.id (where)
  render the cards as json to be sent back to front end -> double check with frontend that data is displaying correctly

  https://stackoverflow.com/questions/68011517/conditional-rails-serializers-for-show-but-not-index