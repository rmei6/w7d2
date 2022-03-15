class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email],password: params[:user][:password])
    if @user
      login(@user)
      redirect_to user_url(@user)
    else
      render :new
    end

    def destroy
      current_user.reset_session_token!
      session[:session_token] = nil
      @current_user = nil
      redirect_to new_session_url
    end
  end
end
