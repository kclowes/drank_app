[![Build Status](https://travis-ci.org/kclowes/drank_app.svg?branch=master)](https://travis-ci.org/kclowes/drank_app)

[![Code Climate](https://codeclimate.com/github/kclowes/drank_app.png)](https://codeclimate.com/github/kclowes/drank_app)

Background
==

This is an app where you can track wines you drank. Users are be able to upload pictures of wine
bottles and are able to rate them.


Staging URL:
==
http://drank-staging.herokuapp.com/

Production URL:
==
http://drank-app.herokuapp.com

Tracker URL:
==
https://www.pivotaltracker.com/n/projects/1068106

Setup
==

1. Bundle install

2. Create databases for development and testing: Run '$rake db:create db:migrate' to create the development
database and run the migrations. You will also need to run '$RAILS_ENV=test rake db:migrate' to setup your testing
database

3. Testing suite is RSpec. To run them: $rake spec

4. Databases also need to be created and migrated on Heroku: $heroku run 'rake db:create' (if you need to) and $heroku run 'rake db:migrate'

5. This application is using carrierwave with rmagick. Please install 'imagemagick' prior to using this app through whatever means you use (if you use homebrew: brew install imagemagick) 




