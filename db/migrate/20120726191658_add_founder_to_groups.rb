class AddFounderToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :founder, :integer
  end
end
