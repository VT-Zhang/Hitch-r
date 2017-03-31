class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def remote_ip
      if request.remote_ip == "10.0.2.2"
          session[:user_ip] = "72.213.254.184"
      else
          session[:user_ip] = request.remote_ip
      end
  end

  def currentDate
      Date.today
  end

  def current_user
      User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user, :remote_ip, :currentDate
end
