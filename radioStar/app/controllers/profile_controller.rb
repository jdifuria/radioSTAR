class ProfileController < ApplicationController
  before_action :authenticate_user!
  respond_to :json

  def index

  end

  def show
    @user = current_user
  end
end
