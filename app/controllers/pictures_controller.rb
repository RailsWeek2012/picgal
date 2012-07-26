class PicturesController < ApplicationController
  def new
    @picture = Picture.new
    @album = Album.find(params[:album_id])
  end

  def create
    @picture = Picture.new(params[:picture])
    @picture.album = Album.find(params[:album_id])

    if @picture.save
      #redirect_to @picture.album, notice: "Picture uploaded."
      redirect_to(session[:return_to] || root_path, notice: "Picture uploaded")
      session[:return_to] = nil
    else
      render "new"
    end
  end

  def show
    @picture = Picture.find(params[:id])
    @comments = Comment.find_all_by_commentable_id_and_commentable_type(@picture.id,@picture.class).reverse
    @comment = Comment.new(:commentable_id => @picture.id)
    @comment.commentable_type = @picture.class

    session[:return_to] = request.env["REQUEST_URI"]
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy

    redirect_to(session[:return_to] || root_path)
    session[:return_to] = nil
  end

end