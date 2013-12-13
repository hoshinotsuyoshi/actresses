# coding:utf-8
class TagsController < ApplicationController
  before_action :set_tag, only: [:edit, :update, :destroy]

  def show
    @actresses = Actress.display.released.to_a
    @tag = Tag.where(:name=>params[:name]).first
    render status: :not_found, file: "#{Rails.root}/public/404.html" and return if !@tag
    @tags = Tag.all
    redirect_to tag_path(@tag.name) if !params[:page].nil? && !params[:page].to_i.between?(1,@tag.page_size-1)
    @title = "#{@tag.name}の画像 全#{@tag.photos.size.to_s}枚#{params[:page].to_i+1}ページ目"
  end

  # GET /tags
  def index
    render :status => :forbidden, :text => "Forbidden fruit" if Rails.env.production?
    @tags = Tag.all
  end

  # GET /tags/new
  def new
    @tag = Tag.new
  end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags
  def create
    @tag = Tag.new(tag_params)

    respond_to do |format|
      if @tag.save
        format.html { redirect_to @tag, notice: 'Tag was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /tags/1
  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to @tag, notice: 'Tag was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /tags/1
  def destroy
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to tags_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.require(:tag).permit(:name,:text)
    end
end
