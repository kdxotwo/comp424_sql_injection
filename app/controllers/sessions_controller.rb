class SessionsController < ApplicationController
  def new
  end
  
  def create
    # secure authentication
    # user = User.authenticate(params[:username], params[:password])

    # insecure authentication
    user = User.insecure_authenticate(params[:username], params[:password])

    if user
      session[:user_id] = user.id
      flash[:success] = "Logged in!"
      redirect_to root_url
    else
      flash.now.alert = "Invalid username or password"
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged out!"
    redirect_to root_url
  end
end
