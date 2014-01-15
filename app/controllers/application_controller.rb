class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate
    return nil if Rails.env.test?
    authenticate_or_request_with_http_basic('Administration') do |username, password|
      1_000_000.times do
        password = Digest::MD5.hexdigest(password)
      end
      username == 'admin' && password == "dc40d86ca84f482ca35bbc90c1a0cb79"
    end
  end
end
