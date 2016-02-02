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
 rails g controller Profile index
 #Features End #
#################################
#### End Scaffold Generation ####
#################################

#################################
#### Change Devise File #########
#################################
  #changes password required length to 1 for testing purposes
  sed -i '145s/.*/  config.password_length = 1..128/' config/initializers/devise.rb
  
  # Devise Confirmation add div container
  sed -i '1i\<div class="container">' app/views/devise/confirmations/new.html.erb
  sed -i "\$a</div>" app/views/devise/confirmations/new.html.erb
  
  # Devise Mailer add div container
  sed -i '1i\<div class="container">' app/views/devise/mailer/unlock_instructions.html.erb
  sed -i "\$a</div>" app/views/devise/mailer/unlock_instructions.html.erb
  sed -i '1i\<div class="container">' app/views/devise/mailer/reset_password_instructions.html.erb
  sed -i "\$a</div>" app/views/devise/mailer/reset_password_instructions.html.erb
  sed -i '1i\<div class="container">' app/views/devise/mailer/confirmation_instructions.html.erb
  sed -i "\$a</div>" app/views/devise/mailer/confirmation_instructions.html.erb
  
  # Devise Passwords add div container
  sed -i '1i\<div class="container">' app/views/devise/passwords/new.html.erb
  sed -i "\$a</div>" app/views/devise/passwords/new.html.erb
  sed -i '1i\<div class="container">' app/views/devise/passwords/edit.html.erb
  sed -i "\$a</div>" app/views/devise/passwords/edit.html.erb
  
  # Devise Registrations add div container
  sed -i '1i\<div class="container">' app/views/devise/registrations/new.html.erb
  sed -i "\$a</div>" app/views/devise/registrations/new.html.erb
  sed -i '1i\<div class="container">' app/views/devise/registrations/edit.html.erb
  sed -i "\$a</div>" app/views/devise/registrations/edit.html.erb
  
  # Devise sessions add div container
  sed -i '1i\<div class="container">' app/views/devise/sessions/new.html.erb
  sed -i "\$a</div>" app/views/devise/sessions/new.html.erb
  
  # Devise sessions add div container
  sed -i '1i\<div class="container">' app/views/devise/unlocks/new.html.erb
  sed -i "\$a</div>" app/views/devise/unlocks/new.html.erb
#################################
#### End Devise File Updates ####
#################################

