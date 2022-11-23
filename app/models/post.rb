class Post < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length:{maximum: 50}
  mount_uploader :picture, PictureUploader

  def user
    return User.find_by(id: self.user_id)
  end

end
