class Thumbnail < ActiveRecord::Base
  belongs_to :prototype
  mount_uploader :image, ImageUploader
  enum status: [ :main, :sub ]
  validates :image, presence: true

end

