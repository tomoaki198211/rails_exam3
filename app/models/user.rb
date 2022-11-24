class User < ApplicationRecord
  has_many :posts
  has_many :favorites, dependent: :destroy
  has_many :favorite_post, through: :favorites, source: :post
  mount_uploader :myimage, MyimageUploader
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: true

  before_validation {email.downcase!}
  has_secure_password
  validates :password, length: { minimum: 6 }
end
