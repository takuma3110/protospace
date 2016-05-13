class AddPrototypeRefToThumbnails < ActiveRecord::Migration
  def change
    add_reference :thumbnails, :prototype, index: true, foreign_key: true
  end
end
