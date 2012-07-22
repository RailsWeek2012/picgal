class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def list
    @user = User.all
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to login_path, notice: "Account created"
    else
      render "new"
    end
  end

  def edit
    @user = current_user
    render "edit"
  end

  def show
    @username = params(:id)
    @user = User.find_by_name(@username)
  end

end