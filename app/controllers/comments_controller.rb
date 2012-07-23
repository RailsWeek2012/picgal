class CommentsController < ApplicationController
  def create
    @commentable = find_commentable
    #@comment = Comment.new(params[:comment])   #backup
    @comment = @commentable.comments.build(params[:comment])

    if @comment.save
      flash[:notice] = 'Comment posted.'
      #redirect_to(root_path)
    else
      flash[:notice] = 'Error: Comment could not be posted.'
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

  private
  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end
