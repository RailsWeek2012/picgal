class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :def_licence
      t.text  :description
      t.boolean :email_notify_comment
      t.string :password_digest

      t.timestamps
    end

    eadd_inxdex :users, :email, unique: true
  end
end
