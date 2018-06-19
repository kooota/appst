class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname
    # like = @user.like_posts
    @post = @user.like_posts

    @likes = Like.all
    @like = Like.where(post_id: params[:post_id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(update_params) if current_user.id?
  end

  private
  def update_params
    params.require(:user).permit(:nickname, :company, :position, :introduction, :twitter, :facebook, :image, :note)
  end


end
