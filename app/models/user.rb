class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :image, ImageUploader

  has_many :posts, through: :likes
  has_many :likes
  has_many :like_posts, through: :likes, source: :post
  has_many :comments

end
