class Post < ActiveRecord::Base

  has_many :likes, dependent: :destroy
  has_many :comments
  has_many :relateds

  belongs_to :user
  belongs_to :category

  mount_uploader :image, ImageUploader

  validates_acceptance_of :confirming
  after_validation :check_confirming

  def check_confirming
    errors.delete(:confirming)
    self.confirming = errors.empty? ? '1' : ''
  end

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
