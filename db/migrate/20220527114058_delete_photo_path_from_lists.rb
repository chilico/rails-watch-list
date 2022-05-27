class DeletePhotoPathFromLists < ActiveRecord::Migration[7.0]
  def change
    remove_column :lists, :photo_path
  end
end
