[![Build Status](https://travis-ci.org/kclowes/drank_app.svg?branch=master)](https://travis-ci.org/kclowes/drank_app)


Drank
===

Background:

This is an app where you can track wines you drank. Eventually users will be able to upload pictures of wine
bottles and be able to rate them.


Staging URL:
===
http://drank-staging.herokuapp.com/

Production URL:
===
http://drank-app.herokuapp.com

Tracker URL:
===
https://www.pivotaltracker.com/n/projects/1068106

Setup
===

1. Bundle install

2. Create databases for development and testing: Run '$rake db:create db:migrate' to create the development
database and run the migrations. You will also need to run '$RAILS_ENV=test db:migrate' to setup your testing
database.

3. Testing suite is RSpec.


