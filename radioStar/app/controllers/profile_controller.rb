class ProfileController < ApplicationController
  before_action :authenticate_user!
  respond_to :json

  def index
    @songs = Song.all
  end

  def show
    @user = current_user
  end

  def radioactivity_login
    password = params[:password]
    email = params[:email]

    @response = 0;

    Unirest.post "http://kcsc.radioactivity.fm/login.html?",
    parameters:{youremail: email, yourpassword: password, submitted: 1} {|response|
      @response = response
      respond_with @response
    }

    # wait for unirest request to respond.
    while @response == 0
    end
  end

  def radioactivity_get_songs
    cookie = params[:cookie]

    @response = 0;

    Unirest.get "http://www.radioactivity.fm/users/yourshows/index.html?expand=all&sorter=reverse",
    parameters:{Cookie: cookie}{|response|
      @response = response
      respond_with @response
    }

    # wait for unirest request to respond.
    while @response == 0
    end


  end


end
