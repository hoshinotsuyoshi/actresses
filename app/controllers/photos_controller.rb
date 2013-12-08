# coding: utf-8
class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  def show_a_photo
    @tags = Tag.all
    @actresses = Actress.display.released.to_a
    @actress = Actress.where(:name=>params[:name]).first
    @photo = Photo.where(:id=>params[:id]).first
    render status: :not_found, file: "#{Rails.root}/public/404.html" and return if !@photo
    @title = "#{@photo.actress.name}の画像 全#{@photo.actress.photos.released.size.to_s}枚 No.#{@photo.actress.photos_sort_by_release_date.index(@photo)+1}"
    if Rails.env.development?
      @photo.point += 1
      @photo.save
    end
  end

  # GET /photos
  def index
    render :status => :forbidden, :text => "Forbidden fruit" if Rails.env.production?
    @photos = Photo.all
  end

  # GET /photos/1
  def show
  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  def create
    @photo = Photo.new(photo_params)

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /photos/1
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /photos/1
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:path, :url, :secure_url)
    end
end
