class AddTitleColumnToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :title, :string
  end
end
