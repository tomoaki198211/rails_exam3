class Post < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length:{maximum: 50}
  mount_uploader :picture, PictureUploader
end
