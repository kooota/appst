class PostsController < ApplicationController

  # before_action :move_to_index, except: :index

  def index
    @post = Post.includes(:user).all.order("created_at DESC")
    @likes = Like.all
    @like = Like.where(post_id: params[:post_id])
  end

  def new
    @post = Post.new

  end

  def show
    @post = Post.find(params[:id])
    @posts = Post.where(category_id: @post.category_id).where.not(id: @post.id)
    @comments = @post.comments.includes(:user)
  end

  def create
    Post.create(title: post_params[:title],subtitle: post_params[:subtitle],content: post_params[:content],service_url: post_params[:service_url],appstore_url: post_params[:appstore_url],googleplay_url: post_params[:googleplay_url],twitter: post_params[:twitter],facebook: post_params[:facebook], image: post_params[:image],image_cache: post_params[:image_cache], category_id: post_params[:category_id],user_id: current_user.id)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params) if post.user_id == current_user.id
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy if post.user_id == current_user.id
    redirect_to "/"
  end

  private
  def post_params
    params.require(:post).permit(:title, :subtitle, :content, :service_url, :appstore_url,:googleplay_url, :twitter, :facebook, :image, :category_id, user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: "index" unless user_signed_in?
  end

end
