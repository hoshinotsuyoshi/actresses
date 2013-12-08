# coding: utf-8
class ActressesController < ApplicationController
  before_action :set_actress, only: [:show, :edit, :update, :destroy]

  # GET /actresses
  def index
    render :status => :forbidden, :text => "Forbidden fruit" if Rails.env.production?
    @actresses = Actress.all
  end

  def index_photos
    @actresses = Actress.display.released.to_a
    @tags = Tag.all
  end

  def sitemap
    @actresses   = Actress.all
    @tags        = Tag.all
    @photos      = Photo.all
    respond_to do |format|
      format.xml
    end
  end

  # GET /actresses/1
  def show
  end

  def show_photos
    @actresses = Actress.display.released.to_a
    @actress = Actress.where(:name=>params[:name]).first
    render status: :not_found, file: "#{Rails.root}/public/404.html" and return if !@actress
    #301
    #redirect_to "/actress/#{@actress.name}",status: 301 and return if params[:page] == "0" 
    redirect_to actress_name_path(@actress.name),status: 301 and return if params[:page] == "0" 
    #302
    #redirect_to "/actress/#{@actress.name}" and return if !params[:page].nil? && !params[:page].to_i.between?(1,@actress.page_size-1)
    redirect_to actress_name_path(@actress.name) and return if !params[:page].nil? && !params[:page].to_i.between?(1,@actress.page_size-1)

    @title = "#{@actress.name}の画像 全#{@actress.photos.released.size.to_s}枚#{params[:page].to_i+1}ページ目"
    @tags = Tag.all
  end

  # GET /actresses/new
  def new
    @actress = Actress.new
  end

  def admin
    @actresses = Actress.all.sort_by{|a|a.name}
    @released = Photo.released
    @unreleased = Photo.unreleased
    @tags = Tag.all
  end

  def similar
    redirect_to admin_path if params[:name].blank?
    actress = Actress.where(:name=>params[:name]).first
    redirect_to admin_path if !actress
    array = [params[:act01],params[:act02],params[:act03],params[:act04],params[:act05]].select{|e| !e.blank?}
    while !array.empty? do
      actress2 = Actress.where(:name=>array.shift).first
      next if !actress2
      similar_regist actress ,actress2
      similar_regist actress2,actress
    end
    redirect_to admin_path
  end

  private
  def similar_regist subject,object
    subject.similars.push object
    subject.similars.uniq!
    subject.save
  end

  public
  def tag
    redirect_to admin_path if params[:name].blank?
    tag = Tag.where(:name=>params[:name]).first
    redirect_to admin_path if !tag
    array = [params[:act01],params[:act02],params[:act03],params[:act04],params[:act05]].select{|e| !e.blank?}
    while !array.empty? do
      actress = Actress.where(:name=>array.shift).first
      next if !actress
      tag_regist tag ,actress
    end
    redirect_to admin_path
  end
  private
  def tag_regist subject,object
    subject.actresses.push object
    subject.actresses.uniq!
    subject.save
  end

  public
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def actress_params
      params.require(:actress).permit(:name, :text, :display)
    end
end
