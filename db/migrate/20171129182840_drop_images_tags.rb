class DropImagesTags < ActiveRecord::Migration[5.0]
  def change
    drop_table :images_tags
  end
end
