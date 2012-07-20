class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :name
      t.integer :album_id
      t.string :filename_orig
      t.string :filename_int
      t.string :licence
      t.text :description
      t.string :source

      t.timestamps
    end
  end
end
