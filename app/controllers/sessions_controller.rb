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
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid username or password"
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
