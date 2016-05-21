class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :thumbnails, dependent: :destroy
  has_one :main_image, -> { where(status: 0) }, class_name: "Thumbnail"
  has_many :sub_images, -> { where(status: 1)}, class_name: "Thumbnail"
  accepts_nested_attributes_for :thumbnails
  validates :title, :catch_copy, :concept, presence: true
end

