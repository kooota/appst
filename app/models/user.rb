class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  has_many :posts, through: :likes
  has_many :likes
  has_many :like_posts, through: :likes, source: :post
  has_many :comments

  mount_uploader :image, ImageUploader

  def self.find_for_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name = auth.info.name
      user.nickname = auth.info.nickname
      user.email = User.dummy_email(auth)
      user.password = Devise.friendly_token[0,20]
      image_url = auth.info.image.to_s
      user.remote_image_url = image_url.gsub('http://','https://')
      user.description = auth.info.description
    end
  #   user = User.where(uid: auth.uid, provider: auth.provider).first
  #   unless user
  #     user = User.create(
  #       uid:      auth.uid,
  #       provider: auth.provider,
  #       email:    User.dummy_email(auth),
  #       password: Devise.friendly_token[0, 20],
  #       image: auth.info.image,
  #       name: auth.info.name,
  #       nickname: auth.info.nickname,
  #       location: auth.info.location
  #     )
  #   end
  #   user
  end

  private
  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end


end
