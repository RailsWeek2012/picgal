class PagesController < ApplicationController
  def home
    if user_signed_in?
      @albums = current_user.albums
    end
  end
end
