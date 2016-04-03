class ProfileController < ApplicationController
  before_action :authenticate_user!
  respond_to :json

  def index
    @songs = Song.all
    @users = User.all
    @shows = Show.all
    @userShows = UserShow.all
    @playlists = Playlist.all
    @charts = Chart.all
    @song = Song.new
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

    page = `curl -X GET -H "Cookie: #{cookie}" -H "Cache-Control: no-cache" "http://www.radioactivity.fm/users/yourshows/index.html?expand=all&sorter=reverse"`
    @page = Nokogiri::HTML(page)
    @songs = ''

    @page.css('div#content table tr td font').each do |item|
      @songs += item.text + '\n'
    end

    @songs = @songs.split('\n')
    @songs.compact!
    @playlist = []
    Struct.new("Song", :time, :title, :artist, :album, :label, :genre)

    i = 0
    until i >= @songs.size do
      data = Struct::Song.new(@songs[i], @songs[i+1], @songs[i+2], @songs[i+3], @songs[i+4], @songs[i+5])
      @playlist.push(data)
      i += 6
    end
    @playlist.delete_at(0)
    respond_with @playlist

  end


end
