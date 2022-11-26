class Post < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :favorite_user, through: :favorites, source: :user
  has_many :likes, dependent: :destroy
  has_many :like_user, through: :likes, source: :user
  belongs_to :user, optional: true
  validates :content, length:{maximum: 50}
  validates :picture, presence: true
  mount_uploader :picture, PictureUploader

  def user
    return User.find_by(id: self.user_id)
  end

end
