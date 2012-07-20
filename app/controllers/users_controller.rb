class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to login_path, notice: "Ihr Benutzerkonto wurde angelegt!"
    else
      render "new"
    end
  end

  def change_passwd

  end

  def change_email

  end

  def change_default_licence

  end
end