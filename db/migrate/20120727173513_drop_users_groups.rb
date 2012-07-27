class DropUsersGroups < ActiveRecord::Migration
  def up
    drop_table :users_groups
  end

  def down
  end
end
