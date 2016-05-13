class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :thumbnails
  accepts_nested_attributes_for :thumbnails
  validates :title, :catch_copy, :concept, presence: true
end

