#!/bin/bash/
#Log of commands used to set-up the basic radiostar back-end
rails new radioStar
cd radioStar

#################################
#### Update Gem File ############
#################################
  #Add gems to Gemfile
  echo "################################" >> Gemfile
  echo "## Custom Gems Below ###########" >> Gemfile
  echo "################################" >> Gemfile
  echo "gem 'devise'" >> Gemfile
  echo "gem 'quiet_assets', group: :development" >> Gemfile
  echo "gem 'better_errors', group: :development" >> Gemfile
  echo "gem 'binding_of_caller', group: :development" >> Gemfile
  # echo "gem 'ember-rails'" >> Gemfile
  # echo "gem 'ember-source', '~> 1.9.0'" >> Gemfile
  echo "################################" >> Gemfile
  echo "## Custom Gems End #############" >> Gemfile
  echo "################################" >> Gemfile
  #Install all gems
  bundle install
#################################
#### End Gem File Update ########
#################################

#################################
#### Rails Scaffold Generation ##
#################################
 rails generate devise:install
 rails generate devise user name:string user_id:integer compliance:float
 rails generate devise:views
 rails generate scaffold Show show_id:integer name:string timeslot:string
 rails generate scaffold UserShow show_id:integer user_id:integer
 rails generate scaffold Playlist show_id:integer chart_id:integer playlist_id:integer date:datetime
 rails generate scaffold Chart name:string country:string source_url:string date:datetime
 rails generate scaffold Song playlist_id:integer title:string artist:string album:string label:string genre:string time:datetime
 #Potential Features for later development below #
 rails generate scaffold Schedule show_id:integer time:int day:int primary_key:string
 #Features End #
#################################
#### End Scaffold Generation ####
#################################
