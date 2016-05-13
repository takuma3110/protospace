class RemovePrototypeIdFromThumbnails < ActiveRecord::Migration
  def change
    remove_column :thumbnails, :prototype_id, :integer
  end
end
