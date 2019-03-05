class RemoveImageFromProperty < ActiveRecord::Migration[5.2]
  def change
    remove_column :properties, :image_url
  end
end
