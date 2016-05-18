class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :thumbnails, dependent: :destroy
  has_one :main_image, class_name: "Thumbnail", foreign_key: "prototype_id"
  accepts_nested_attributes_for :thumbnails
  validates :title, :catch_copy, :concept, presence: true
end

