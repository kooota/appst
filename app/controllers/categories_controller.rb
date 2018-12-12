class CategoriesController < ApplicationController
  def show
    @post = Post.where(category_id: params[:id]).order("likes_count DESC").page(params[:page]).per(8)
    @category = Category.find(params[:id])
    @categories = Category.all
    # @likes = Like.all
    @like = Like.where(post_id: params[:post_id])
  end
end
