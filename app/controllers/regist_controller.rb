class RegistController < ApplicationController
  before_action :authenticate
  protect_from_forgery except: :photo #easy-api

  def photo
    opt = [params[:actress_name],params[:path],params[:release_date]]
    hash = {result: Regist.perform(opt)}
    render json: hash, content_type: 'text/json' 
  end
  def form
  end
end
