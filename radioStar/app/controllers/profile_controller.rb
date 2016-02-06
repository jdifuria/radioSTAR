class ProfileController < ApplicationController
  before_action :authenticate_user!
  respond_to :json

  def index
    
  end

  def show

  end
end
