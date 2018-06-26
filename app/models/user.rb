class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, through: :likes
  has_many :likes
  has_many :like_posts, through: :likes, source: :post
  has_many :comments

  # mount_uploader :image, ImageUploader

 # crop用の仮想attribute
  # attr_accessor :image_x
  # attr_accessor :image_y
  # attr_accessor :image_w
  # attr_accessor :image_h

end
