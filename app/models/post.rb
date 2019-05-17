class Post < ApplicationRecord

  mount_uploader :image, ImageUploader

  has_many :likes, dependent: :destroy
  has_many :comments , inverse_of: :post
  has_many :relateds
  belongs_to :user
  belongs_to :category

  accepts_nested_attributes_for :comments

  def like_user(user_id)
   likes.find_by(user_id: user_id)
  end

  def self.search(search)
    if search
      Post.where(['title LIKE ?', "%#{search}%"])
    else
      Post.all
    end
  end
end
