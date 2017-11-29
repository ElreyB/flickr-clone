class UpdateCommentsTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :comments, :photo_id
    add_column :comments, :image_id, :integer
  end
end
