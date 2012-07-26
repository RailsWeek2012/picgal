class PagesController < ApplicationController
  def home
    if user_signed_in?
      @albums = current_user.albums
    end
  end

  def licences
    @licences = Licence.all
  end

end
