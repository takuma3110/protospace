class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :thumbnails , dependent: :destroy
  has_one :main_image, -> {where(status: Thumbnail.statuses[:main])}, class_name: "Thumbnail"
  has_many :sub_images, -> {where(status: Thumbnail.statuses[:sub])}, class_name: "Thumbnail"
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :thumbnails, reject_if: :reject_posts
  validates :title, :catch_copy, :concept, presence: true
  acts_as_taggable
  acts_as_taggable_on :prototypes
  acts_as_ordered_taggable_on :prototypes

  paginates_per 8

  def liked_by?(user)
   likes.find_by(user_id: user.id)
  end

  def reject_posts(attributed)
    attributed['image'].blank?
  end

 MAXIMUM_NUM = 3
  def set_sub_img
    sub_images = thumbnails.sub
    MAXIMUM_NUM.times { |i| sub_images[i] ||= thumbnails.build(status: "sub") }
    sub_images

  end
end


