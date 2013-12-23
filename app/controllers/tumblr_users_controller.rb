class TumblrUsersController < ApplicationController
  before_action :forbid_production
  before_action :set_tumblr_user, only: [:show, :edit, :update, :destroy]

  # GET /tumblr_users
  # GET /tumblr_users.json
  def index
    @tumblr_users = TumblrUser.all
  end

  # GET /tumblr_users/1
  # GET /tumblr_users/1.json
  def show
  end

  # GET /tumblr_users/new
  def new
    @tumblr_user = TumblrUser.new
  end

  # GET /tumblr_users/1/edit
  def edit
  end

  # POST /tumblr_users
  # POST /tumblr_users.json
  def create
    @tumblr_user = TumblrUser.new(tumblr_user_params)

    respond_to do |format|
      if @tumblr_user.save
        format.html { redirect_to @tumblr_user, notice: 'Tumblr user was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tumblr_user }
      else
        format.html { render action: 'new' }
        format.json { render json: @tumblr_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tumblr_users/1
  # PATCH/PUT /tumblr_users/1.json
  def update
    respond_to do |format|
      if @tumblr_user.update(tumblr_user_params)
        format.html { redirect_to @tumblr_user, notice: 'Tumblr user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tumblr_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tumblr_users/1
  # DELETE /tumblr_users/1.json
  def destroy
    @tumblr_user.destroy
    respond_to do |format|
      format.html { redirect_to tumblr_users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tumblr_user
      @tumblr_user = TumblrUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tumblr_user_params
      params.require(:tumblr_user).permit(:host, :consumer_key, :consumer_secret, :oauth_token, :oauth_token_secret)
    end

    def forbid_production
      render :status => :forbidden, :text => "Forbidden fruit" and return if Rails.env.production?
    end
 
end
