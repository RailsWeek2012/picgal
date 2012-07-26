class AddRemoteImageUrlToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :remote_image_url, :string
  end
end
