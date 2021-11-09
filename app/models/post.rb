class Post < ApplicationRecord
  has_one_attached :image, dependent: false
  has_one_attached :image
  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  attr_accessor :remove_image
  validates :content, length: { maximum: 2000 }, presence: true
  before_save :remove_image_if_user_accept

  private

  def remove_image_if_user_accept
    self.image = nil if ActiveRecord::Type::Boolean.new.cast(remove_image)
  end
end
