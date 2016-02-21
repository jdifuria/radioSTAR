#!/bin/bash/
echo "==============================================================="
echo "Installing all Gem Files"
echo "==============================================================="
bundle install
echo "==============================================================="
echo "Raking Routes"
echo "==============================================================="
rake routes
echo "==============================================================="
echo "Dropping old Database so we can start fresh"
echo "==============================================================="
rake db:drop
echo "==============================================================="
echo "Updating Version: Applying any new migrations"
echo "==============================================================="
rake db:migrate
echo "==============================================================="
echo "Seeding the database"
echo "==============================================================="
rake db:seed
echo "==============================================================="
echo "Setting database to production. "
echo "==============================================================="
RAILS_ENV=production rake db:drop
RAILS_ENV=production rake db:migrate
RAILS_ENV=production rake assets:clean
RAILS_ENV=production rake assets:precompile
RAILS_ENV=production rake db:seed
echo "==============================================================="
echo "Starting up the server"
echo "==============================================================="
sudo apache2ctl restart
rails s -b 0.0.0.0
