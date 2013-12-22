class JobController < ApplicationController
  def regist_photo
    opt = [params[:actress_name],params[:path],params[:release_date]]
    hash = {result: RegistPhoto.perform(opt)}
    render json: hash, content_type: 'text/json' 
  end
  def form
  end
end
