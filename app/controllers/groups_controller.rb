class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(params[:group])
    @group.founder = current_user.id
    # Gründer heißt nicht automatisch auch Mitglied! So kann man als Admin Gruppen vorgeben.

    if @group.save
      flash[:notice] = 'Group founded. Join if you want to take part in it!'
      redirect_to(session[:return_to] || root_path)
      session[:return_to] = nil
    else
      flash[:notice] = 'Error: Group could not be founded.'
      render :action => 'new'
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(params[:group])
      redirect_to group_path(@group), notice: "Group updated"
    else
      render action: "edit"
    end
  end

  def show
    @group = Group.find(params[:id])
    @users = @group.users

    # Das geht sicher auch einfacher, aber eleganter habe ich es leider nicht geschafft.
    @comments = Comment.find_all_by_commentable_id_and_commentable_type(@group.id, @group.class).reverse
    @comment = Comment.new(:commentable_id => @group.id)
    @comment.commentable_type = @group.class

    # Wie oben.
    @pictures = Picture.find_all_by_album_id(Album.find_all_by_user_id(@users)).last(10).reverse
    session[:return_to] = request.env["REQUEST_URI"]
  end

  def index
    @groups = Group.all
  end

  def join
    @group = Group.find(params[:id])
    @user = current_user
    @membership = GroupsUsers.new(:group_id => @group.id, :user_id => @user.id)

    if @membership.save
      redirect_to(session[:return_to] || root_path, notice: "You joined. Welcome :)")
      session[:return_to] = nil
    else
      redirect_to group_path(@group), notice: "Error: Could not join group"
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to(session[:return_to] || root_path)
    session[:return_to] = nil
  end

end
