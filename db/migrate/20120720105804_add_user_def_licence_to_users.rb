class AddUserDefLicenceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :def_licence, :integer
  end
end
