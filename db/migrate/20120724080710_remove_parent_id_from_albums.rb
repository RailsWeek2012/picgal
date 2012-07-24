class RemoveParentIdFromAlbums < ActiveRecord::Migration
  def up
    remove_column :albums, :parent_id
  end

  def down
    add_column :albums, :parent_id, :integer
  end
end
