class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :thumbnails, dependent: :destroy
  has_one :main_image, -> {where(status: Thumbnail.statuses[:main])}, class_name: "Thumbnail"
  has_many :sub_images, -> {where(status: Thumbnail.statuses[:sub])}, class_name: "Thumbnail"
  accepts_nested_attributes_for :thumbnails, reject_if: :reject_posts
  validates :title, :catch_copy, :concept, presence: true

  def reject_posts(attributed)
    attributed['image'].blank?
  end
end

