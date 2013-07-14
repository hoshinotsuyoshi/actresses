class SimilarActressesController < ApplicationController
  before_action :set_similar_actress, only: [:show, :edit, :update, :destroy]

  # GET /similar_actresses
  # GET /similar_actresses.json
  def index
    @similar_actresses = SimilarActress.all
  end

  # GET /similar_actresses/1
  # GET /similar_actresses/1.json
  def show
  end

  # GET /similar_actresses/new
  def new
    @similar_actress = SimilarActress.new
  end

  # GET /similar_actresses/1/edit
  def edit
  end

  # POST /similar_actresses
  # POST /similar_actresses.json
  def create
    @similar_actress = SimilarActress.new(similar_actress_params)

    respond_to do |format|
      if @similar_actress.save
        format.html { redirect_to @similar_actress, notice: 'Similar actress was successfully created.' }
        format.json { render action: 'show', status: :created, location: @similar_actress }
      else
        format.html { render action: 'new' }
        format.json { render json: @similar_actress.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /similar_actresses/1
  # PATCH/PUT /similar_actresses/1.json
  def update
    respond_to do |format|
      if @similar_actress.update(similar_actress_params)
        format.html { redirect_to @similar_actress, notice: 'Similar actress was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @similar_actress.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /similar_actresses/1
  # DELETE /similar_actresses/1.json
  def destroy
    @similar_actress.destroy
    respond_to do |format|
      format.html { redirect_to similar_actresses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_similar_actress
      @similar_actress = SimilarActress.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def similar_actress_params
      params.require(:similar_actress).permit(:name)
    end
end
