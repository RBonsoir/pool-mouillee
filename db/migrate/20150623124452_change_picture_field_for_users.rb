class ChangePictureFieldForUsers < ActiveRecord::Migration
  def change
    remove_column :users, :profile_pic, :string
    rename_column :users, :picture, :facebook_picture
  end
end
