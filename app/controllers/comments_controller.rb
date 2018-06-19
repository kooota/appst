class CommentsController < ApplicationController

  def create
    @comment = Comment.create(content: comment_params[:content], post_id: comment_params[:post_id], user_id: current_user.id)
    redirect_to "/posts/#{@comment.post_id}"
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy if comment.user_id == current_user.id
    redirect_to "/posts/#{comment.post_id}"
  end


  def comment_params
    params.permit(:content, :post_id)
  end

end
