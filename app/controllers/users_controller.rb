class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def list
    @users = User.all
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      UserMailer.welcome_email(@user).deliver
      redirect_to login_path, notice: "Account created"
    else
      render "new"
    end
  end

  def edit
    @user = current_user
    render "edit"
  end

  def update
    @user = current_user
    if @user.update_attribute(params[:user])
      redirect_to root_path, notice: "Profile updated."
    else
      render action: "edit"
    end
  end

  def show
    @username = params[:id]
    @user = User.find_by_name(@username)

    @comment = Comment.new( :commentable_type => @user )        # not sure if..
  end
end