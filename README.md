Dinelyy Restaurant Reservation System
================
Dinelyy is restaurant reservation system is B2B & B2C with fast table management, a powerful restaurant reservation system and 
guest management, Dinelyy gives you everything you need to stay organized, improve hospitality, and increase revenue.

This application requires:

- Ruby 2.3.1
- Rails 5.0.0

Getting Started
---------------
- install rvm & postgresql (for MacOS: brew install postgresql, brew services run postgresql)
- create postgres database and dinelyy user: see config/database.yml
- ALTER DATABASE dinelyy_rails_development OWNER TO dinelyy;
- GRANT ALL PRIVILEGES ON database dinelyy_rails_development TO dinelyy;
- rvm install 2.3.1
- rvm use 2.3.1
- (create rvm gemset, if not already created by ruby-gemset file.)
- gem install rails --version=5.0.0
- bundle install
- rake db:drop
- rake db:create
- rails db:migrate RAILS_ENV=development
- rake db:seed
- bundle exec rake acts_as_bookable_engine:install:migrations
- bundle exec rake db:migrate
- rails server puma

Admin credentials are in the config.

Documentation and Support
-------------------------
Summary: Providing discounts to patrons and light-weight reservation management by restaurant owners.

Remove protect_from_forgery under applicationcontroller

Required all json
curl -H "Accept:application/json" localhost:3000/restaurants.json | json_pp

Add new json file
curl -H "Content-Type: application/json" -X POST -d '{"name": "test1"}' http://localhost:3000/restaurants

Update a exit json file
curl -H "Content-Type: application/json" -X POST -d '{"name": "test1"}' http://localhost:3000/restaurants/1

Debug
-------
If met problem of Migrations are pending. To resolve this issue
1. rake db:drop
2. rake db:create
3. rake db:migrate


Features
--------
1. Super Admin Dashboard for back-office.
2. Restaurant owners can register their restaurant to this system.
3. Restaurant admin can update following.
- Restaurant information
- Tables available and not available
- Special offers on certain day
- Booking status & transaction history
4. Users can book table in any restaurant in this system.


Tech Used
--------
- Ruby on Rails 5.0
- ERB Template for front-end
- Postgresql
- Rspec for unit test
- Sidkiq for back-end process
- Authorize.net for payment integration




