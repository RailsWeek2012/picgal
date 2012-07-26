class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    @comment.user = current_user

    if @comment.save
      flash[:notice] = 'Comment posted.'
      redirect_to(session[:return_to] || root_path)
      session[:return_to] = nil
    else
      flash[:notice] = 'Error: Comment could not be posted.'
      render :action => 'new'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to(session[:return_to] || root_path)
    session[:return_to] = nil
  end

  def new
    @comment = Comment.new
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = 'Comment edited.'
      redirect_to(session[:return_to] || root_path)
      session[:return_to] = nil
    else
      flash[:notice] = 'Error: Comment could not be edited.'
      render action: "edit"
    end
  end
end
