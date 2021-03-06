class UsersController < ApplicationController
  #TODO [3]: "new" und "create" aus dem Bookmarkmanager-Foliensatz
  def new
    @user = User.new
  end

  def index
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
  end

  def update
    @user = User.find(session[:user_id])
    if @user.update_attributes(params[:user])
      redirect_to root_path, notice: "Profile updated."
    else
      render action: "edit"
    end
  end

  def show
    @user = User.find_by_name(params[:id])
    @comments = Comment.find_all_by_commentable_id_and_commentable_type(@user.id, @user.class).reverse
    @comment = Comment.new(:commentable_id => @user.id)
    @comment.commentable_type = @user.class
    @albums = Album.find_all_by_user_id(@user.id)
    session[:return_to] = request.env["REQUEST_URI"]
  end
end