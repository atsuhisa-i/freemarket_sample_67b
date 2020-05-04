class Picture < ApplicationRecord
  belongs_to :item

  validates :image, :item, presence: true

  mount_uploader :image, ImageUploader
end
