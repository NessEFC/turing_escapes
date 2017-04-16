class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      if @user.admin?
        session[:user_id] = @user.id
        redirect_to admin_dashboard_path
      else
        session[:user_id] = @user.id
        redirect_to dashboard_path
      end
    else
      render :new
    end
  end

  def destroy
    session.clear
    flash[:message] = "Successfully logged out. Bye Felicia."
    redirect_to root_path
  end

end