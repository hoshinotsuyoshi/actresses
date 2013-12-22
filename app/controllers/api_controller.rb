class ApiController < ApplicationController
  def index
    @response = Api.create!(params)
    render json: @response
  end
end
