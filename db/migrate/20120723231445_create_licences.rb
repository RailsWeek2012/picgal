class CreateLicences < ActiveRecord::Migration
  def change
    create_table :licences do |t|
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
