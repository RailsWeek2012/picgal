class AddDescriptionToLicences < ActiveRecord::Migration
  def change
    add_column :licences, :description, :text
  end
end
