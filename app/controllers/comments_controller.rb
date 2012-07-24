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

    #redirect_to()
  end

  def new
    @comment = Comment.new
  end
end
