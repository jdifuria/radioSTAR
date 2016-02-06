class UserShowsController < ApplicationController
  before_action :set_user_show, only: [:show, :edit, :update, :destroy]
  respond_to :json

  # GET /user_shows
  # GET /user_shows.json
  def index
    @user_shows = UserShow.all
    respond_with @user_shows
  end

  # GET /user_shows/1
  # GET /user_shows/1.json
  def show
    respond_with @user_show
  end

  # GET /user_shows/new
  def new
    @user_show = UserShow.new
  end

  # GET /user_shows/1/edit
  def edit
  end

  # POST /user_shows
  # POST /user_shows.json
  def create
    @user_show = UserShow.new(user_show_params)

    respond_to do |format|
      if @user_show.save
        format.html { redirect_to @user_show, notice: 'User show was successfully created.' }
        format.json { render :show, status: :created, location: @user_show }
      else
        format.html { render :new }
        format.json { render json: @user_show.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_shows/1
  # PATCH/PUT /user_shows/1.json
  def update
    respond_to do |format|
      if @user_show.update(user_show_params)
        format.html { redirect_to @user_show, notice: 'User show was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_show }
      else
        format.html { render :edit }
        format.json { render json: @user_show.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_shows/1
  # DELETE /user_shows/1.json
  def destroy
    @user_show.destroy
    respond_to do |format|
      format.html { redirect_to user_shows_url, notice: 'User show was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_show
      @user_show = UserShow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_show_params
      params.require(:user_show).permit(:show_id, :user_id)
    end
end
