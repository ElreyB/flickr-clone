class RenameImagesUsersToFavorites < ActiveRecord::Migration[5.0]
  def change
    rename_table :images_users, :favorites
  end
end
