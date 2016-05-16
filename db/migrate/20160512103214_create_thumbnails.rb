class CreateThumbnails < ActiveRecord::Migration
  def change
    create_table :thumbnails do |t|
      t.string :image
      t.integer :status
      t.timestamps
    end
    add_reference :thumbnails, :prototype, index: true, foreign_key: true
  end
end
