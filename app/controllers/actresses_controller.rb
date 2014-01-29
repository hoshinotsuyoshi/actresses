# coding: utf-8
class ActressesController < ApplicationController
  protect_from_forgery except: [:parts_random, :parts_indivisual]
  before_action :authenticate, only: [:index,:new,:edit,:create,:update,:destroy]
  before_action :set_tags, only: [:index_photos,:show]
  before_action :set_actresses, only: [:index_photos,:show, :parts_random]
  before_action :set_actress, only: [:show,:edit, :update, :destroy]

  # GET /actresses
  def index
    @actresses = Actress.all
  end

  def index_photos
  end

  def parts_random
    respond_to do |format|
      format.js { render }
    end
  end

  def parts_indivisual
    respond_to do |format|
      format.js { render }
    end
  end

  def show
    render status: :not_found, file: "#{Rails.root}/public/404.html" and return if !@actress
    #301
    redirect_to @actress,status: 301 and return if params[:page] == "0" 
    #302
    redirect_to @actress and return if !params[:page].nil? && !params[:page].to_i.between?(1,@actress.page_size-1)
    @title = "#{@actress.name}の画像 全#{@actress.photos.released.size.to_s}枚#{params[:page].to_i+1}ページ目"
  end

  # GET /actresses/new
  def new
    @actress = Actress.new
  end

  # GET /actresses/1/edit
  def edit
  end

  # POST /actresses
  def create
    @actress = Actress.new(actress_params)

    respond_to do |format|
      if @actress.save
        format.html { redirect_to @actress, notice: 'Actress was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /actresses/1
  def update
    respond_to do |format|
      if @actress.update(actress_params)
        format.html { redirect_to @actress, notice: 'Actress was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /actresses/1
  def destroy
    @actress.destroy
    respond_to do |format|
      format.html { redirect_to actresses_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actress
      @actress = Actress.find(params[:id])
    end

    def set_actresses
      @actresses = Actress.display.released.to_a
      @picked = Actress.all.picked
    end

    def set_tags
      @tags = Tag.all
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def actress_params
      params.require(:actress).permit(:name, :text, :display, :pick_up)
    end
end
