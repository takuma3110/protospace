class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :thumbnails , dependent: :destroy
  has_one :main_image, -> {where(status: Thumbnail.statuses[:main])}, class_name: "Thumbnail"
  has_many :sub_images, -> {where(status: Thumbnail.statuses[:sub])}, class_name: "Thumbnail"
  accepts_nested_attributes_for :thumbnails, reject_if: :reject_posts
  validates :title, :catch_copy, :concept, presence: true

  def reject_posts(attributed)
    attributed['image'].blank?
  end


  def set_sub_img
    sub_images = thumbnails.sub
    num = sub_images.count

    if num == 0
      3.times { sub_images << thumbnails.build(status: 'sub') }
    elsif num == 1
      2.times { sub_images << thumbnails.build(status: 'sub') }
    elsif num == 2
        sub_images << thumbnails.build(status: 'sub')
    end
    return sub_images
  end
end


