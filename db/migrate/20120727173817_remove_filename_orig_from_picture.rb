class RemoveFilenameOrigFromPicture < ActiveRecord::Migration
  def up
    remove_column :Pictures, :filename_orig
    remove_column :Pictures, :filename_int
  end

  def down
  end
end
