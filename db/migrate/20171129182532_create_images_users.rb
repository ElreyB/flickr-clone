class CreateImagesUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :images_users do |t|
      t.integer :image_id
      t.integer :user_id

      t.timestamps
    end
  end
end
