# LangReactor Back End (front end repo here: https://github.com/tdimp/langreactor2-frontend)

This serves as the back end API for LangReactor. Ruby v 2.7.4; Rails v 7.0.3.1; 

To get started: create the PostgreSQL database, run the migrations, and seed the data with:
  $sudo service postgresql start
  $rails db:create db:migrate db:seed

Then, start the server with: 
  $rails s

Once the server is up and running, make sure the front end is up and running as well. From there, you can use LangReactor's full functionality!