class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Login successful"
    else
      flash.now.alert = "Invalid email address or password"
      render action: "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to(session[:return_to] || root_path, notice: "Logout successful. Bye! :)")
  end
end