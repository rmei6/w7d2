class ApplicationController < ActionController::Base
  helper_methods :current_user,:logged_in?
  def login(user)
    session[:session_token] = user.reset_session_token!
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    session[:session_token] == current_user.session_token
  end
end
