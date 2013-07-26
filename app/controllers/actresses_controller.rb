# coding: utf-8
class ActressesController < ApplicationController
  require 'kconv'
  before_action :set_actress, only: [:show, :edit, :update, :destroy]

  # GET /actresses
  # GET /actresses.json
  def index
    @actresses = Actress.all
  end

  def index_photos
    @actresses = Actress.all
  end

  # GET /actresses/1
  # GET /actresses/1.json
  def show
  end

  def show_photos
    @actresses = Actress.all
    @actress = Actress.where(:name=>params[:name]).first
    page_size = (@actress.photos.size.to_f / 8 ).ceil
    redirect_to "/actress/#{@actress.name}" unless params[:page].to_i.between? 0,page_size-1
    @title = "#{@actress.name}の画像 全#{@actress.photos.size.to_s}枚#{params[:page].to_i+1}ページ目"
    @sidebar = true
  end

  def show_a_photo
    @actresses = Actress.all
    @actress = Actress.where(:name=>params[:name]).first
    @page    = params[:page].to_i
  end

  # GET /actresses/new
  def new
    @actress = Actress.new
  end

  def admin
    @actresses = Actress.all
  end

  def admin_post
    redirect '/admi' if params[:name].blank?
    actress = params[:name]
    array = [params[:url01],params[:url02],params[:url03],params[:url04],params[:url05],params[:url06],params[:url07],params[:url08],params[:url09],params[:url10]].select{|e| !e.blank?}
    while !array.empty? do
      Resque.enqueue Demo::ActressJob,[actress,array.shift]
    end
    redirect '/admi' 
  end

  def similar
    @actresses = Actress.all
  end

  # GET /actresses/1/edit
  def edit
  end

  # POST /actresses
  # POST /actresses.json
  def create
    @actress = Actress.new(actress_params)

    respond_to do |format|
      if @actress.save
        format.html { redirect_to @actress, notice: 'Actress was successfully created.' }
        format.json { render action: 'show', status: :created, location: @actress }
      else
        format.html { render action: 'new' }
        format.json { render json: @actress.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /actresses/1
  # PATCH/PUT /actresses/1.json
  def update
    respond_to do |format|
      if @actress.update(actress_params)
        format.html { redirect_to @actress, notice: 'Actress was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @actress.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actresses/1
  # DELETE /actresses/1.json
  def destroy
    @actress.destroy
    respond_to do |format|
      format.html { redirect_to actresses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actress
      @actress = Actress.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def actress_params
      params.require(:actress).permit(:name, :text, :display)
    end
end
