class ApiController < ApplicationController
  def validate
    @api = Api.create!
    render json: @api
  end
end
