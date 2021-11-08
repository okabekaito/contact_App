class Post < ApplicationRecord
  has_one_attached :image, dependent: false
  has_one_attached :image
  belongs_to :user
  has_many :comments

  attr_accessor :remove_image

  before_save :remove_image_if_user_accept

  private

  def remove_image_if_user_accept
    self.image = nil if ActiveRecord::Type::Boolean.new.cast(remove_image)
  end
end
