class ProfileController < ApplicationController
  before_action :authenticate_user!
  respond_to :json

  def index
    @songs = Song.all
  end

  def show
    @user = current_user
  end

  def radioactivity
    password = params[:password]
    email = params[:email]

    @response = 0;

    @repsonse = Unirest.post "http://kcsc.radioactivity.fm/login.html?",
    parameters:{youremail: email, yourpassword: password, submitted: 1} {|response|
      @response = response
      respond_with @response
    }

    # wait for unirest request to respond.
    while @response == 0
    end

  end


end
