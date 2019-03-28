class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @name = @user.name
    @nickname = @user.nickname
    # like = @user.like_posts
    @post = Post.where(user_id: @user.id).order("created_at DESC").page(params[:page]).per(8)
    @likes = Like.all
    @like = Like.where(post_id: params[:post_id])
  end

  def edit
    @user = User.find(params[:id])
    @user.image.cache! unless @user.image.blank?
    redirect_to action: "show" unless user_signed_in? && @user.id == current_user.id
  end

  def update
    @user = User.find(params[:id])
    @user.update(update_params) if current_user.id?
  end

  def favorite
    @user = User.find(params[:id])
    @name = @user.name
    @nickname = @user.nickname
    @post = @user.like_posts.order("created_at DESC").page(params[:page]).per(8)
    @likes = Like.all
    @like = Like.where(post_id: params[:post_id])
  end

  private
  def update_params
    params.require(:user).permit(:name, :company, :position, :description, :twitter, :facebook, :image, :note,:image_cache, :nickname)
  end


end
