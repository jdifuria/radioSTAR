class ProfileController < ApplicationController
  before_action :authenticate_user!
  respond_to :json

  def index
    @users = User.all
    @shows = Show.all
    @userShows = UserShow.all
    @station = Station.find(station.id == current_user.station_id)
  end
