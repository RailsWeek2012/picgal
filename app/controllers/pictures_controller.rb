class PicturesController < ApplicationController
  def new
    @picture = Picture.new
    @album = Album.find(params[:album_id])
  end

  def create
    @picture = Picture.new(params[:picture])
    @picture.album = Album.find(params[:album_id])

    if @picture.save
      redirect_to(session[:return_to] || root_path, notice: "Picture uploaded")
      session[:return_to] = nil
    else
      render "new"
    end
  end

  def edit
    @picture = Picture.find(params[:id])
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

  def update
    @picture = Picture.find(params[:id])
    if @picture.update_attributes(params[:picture])
      flash[:notice] = 'Picture edited.'
      redirect_to(session[:return_to] || root_path)
      session[:return_to] = nil
    else
      flash[:notice] = 'Error: Picture could not be edited.'
      render action: "edit"
    end
  end

end