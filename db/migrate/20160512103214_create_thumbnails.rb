class CreateThumbnails < ActiveRecord::Migration
  def change
    create_table :thumbnails do |t|
      t.string :image
      t.integer :status
      t.integer :prototype_id
      t.timestamps
    end
  end
end
