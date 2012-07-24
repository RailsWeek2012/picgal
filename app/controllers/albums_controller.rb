class AlbumsController < ApplicationController
  def new
    @album = Album.new
  end

  def create
    @album = Album.new(params[:album])
    if @album.save
      flash[:notice] = 'Album created.'
      redirect_to(session[:return_to] || root_path)
      session[:return_to] = nil
    else
      flash[:notice] = 'Error: Album could not be created.'
      render :action => 'new'
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy

    #redirect_to(session[:return_to] || root_path)
    #session[:return_to] = nil
  end

end
