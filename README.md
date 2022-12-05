# LangReactor Back End (front end repo here: https://github.com/tdimp/langreactor2-frontend)

LangReactor is a fullstack language-learning flash card app, where users can create decks of flashcards for studying new languages. The flashcards can be "flipped", where alternative text is displayed, and each card has the option to include an image to help language acquisition.

Once the back end is up and running, a user can create an account and start creating decks and cards! The UI is intuitive and simple to use. What are you waiting for? Start learning today!

This serves as the back end API for LangReactor. Ruby v 2.7.4; Rails v 7.0.3.1; 

To get started: create the PostgreSQL database, run the migrations, and seed the data with:
  $sudo service postgresql start
  $rails db:create db:migrate db:seed

Then, start the server with: 
  $rails s

Once the server is up and running, make sure the front end is up and running as well. From there, you can use LangReactor's full functionality!