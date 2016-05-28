class CreatePrototypes < ActiveRecord::Migration
  def change
    create_table :prototypes do |t|
      t.string   :title
      t.string   :catch_copy
      t.text   :concept
      t.integer :likes_num
      t.timestamps
    end
    add_reference :prototypes, :user, index: true, foreign_key: true
  end
end

