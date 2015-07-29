class SessionsController < ApplicationController

  def new
    if logged_in? 
      flash[:error] = "You are already logged in"
      redirect_to root_path
    end
  end

  def create
    user = User.where(username: params[:username]).first
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome, you've logged in."
      redirect_to root_path
    else
      flash[:error] = "There is something wrong"
      redirect_to login_path

    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You've logged out."
    redirect_to root_path
  end
end