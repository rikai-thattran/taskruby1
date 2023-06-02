require 'mini_magick'
class Micropost < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  before_save :display_image
  belongs_to :user
#   has_many_attached :image_url
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate :validate_image_format
  
  def display_image
    return unless image.attached?  # Kiểm tra xem hình ảnh đã được đính kèm hay chưa
    image.variant(resize: '300x200') 
  end
  private

  def validate_image_format
    return unless image.attached?

    errors.add(:image, 'must be a valid image format') unless image.content_type.in?(%w[image/jpeg image/gif image/png])

    return unless image.byte_size > 5.megabytes

    errors.add(:image, 'should be less than 5MB')
  end

end
