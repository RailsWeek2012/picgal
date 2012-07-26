class PicturesController < ApplicationController
  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(params[:picture])
    @picture.album =
    if @picture.save
      #redirect_to @picture.album, notice: "Picture uploaded."
      redirect_to(session[:return_to] || root_path, notice: "Picture uploaded") ## Test..
      session[:return_to] = nil                                         ##
    else
      render "new"
    end
  end
end
