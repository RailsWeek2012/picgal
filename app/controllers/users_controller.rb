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
    #render "edit"
  end

  def update
    #@user = current_user
    @user = User.find(session[:user_id])
    #if @user.update_attribute(params[:name])
    if @user.update_attributes(params[:user])
      redirect_to root_path, notice: "Profile updated."
    else
      render action: "edit"
    end
  end

  def show
    @username = params[:id]
    @user = User.find_by_name(@username)

    #@comments = Comment.all                                  # works!
    @comments = Comment.find_all_by_commentable_id(@user.id)  # works without nil errors!
    @comment = Comment.new#(:user => @user)
  end
end