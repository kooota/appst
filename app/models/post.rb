class Post < ActiveRecord::Base
  has_many :likes, dependent: :destroy
  has_many :comments

  belongs_to :user
  belongs_to :category

  # mount_uploader :image, ImageUploader


  def like_user(user_id)
   likes.find_by(user_id: user_id)
  end
end
