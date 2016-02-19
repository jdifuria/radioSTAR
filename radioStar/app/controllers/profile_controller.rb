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

    @repsonse = Unirest.post "http://kcsc.radioactivity.fm/login.html?",
    parameters:{youremail: email, yourpassword: password} {|response|
      throw "done"
      @response = response
      respond_with @response
    }

  end


end
