class CreateNewImagesTags < ActiveRecord::Migration[5.0]
  def change
    create_table :images_tags do |t|
      t.integer :image_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
