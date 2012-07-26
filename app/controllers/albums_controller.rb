class AlbumsController < ApplicationController
  def new
    @album = Album.new
  end

  def create
    @album = Album.new(params[:album])
    @album.user = current_user
    if @album.save
      flash[:notice] = 'Album created.'

      # Redirection directly into the freshly created gallery!
      redirect_to(album_path(@album))
    else
      flash[:notice] = 'Error: Album could not be created.'
      render :action => 'new'
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy

    redirect_to(session[:return_to] || root_path)
    session[:return_to] = nil
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(params[:album])
      redirect_to root_path, notice: "Gallery updated."
    else
      render action: "edit"
    end
  end

  def show
    @album = Album.find(params[:id])
    @comments = Comment.find_all_by_commentable_id_and_commentable_type(@album.id,@album.class).reverse
    @comment = Comment.new(:commentable_id => @album.id)
    @comment.commentable_type = @album.class
    session[:return_to] = request.env["REQUEST_URI"]
  end

end
