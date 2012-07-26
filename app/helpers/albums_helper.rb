module AlbumsHelper
  def is_owner?(album)
    return current_user == album.user
  end
end