class CategoriesController < ApplicationController
  def show
    @post = Post.where(category_id: params[:id])
    @category = Category.find(params[:id])
    # @likes = Like.all
    @like = Like.where(post_id: params[:post_id])
  end
end
