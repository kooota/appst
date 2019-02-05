class PostsController < ApplicationController
  # before_action :move_to_index, except: :index
  require 'metainspector'

  def index
    @post = Post.includes(:user).all.order("created_at DESC").page(params[:page]).per(9)
    @likes = Like.all
    @like = Like.where(post_id: params[:post_id])
    @categories = Category.all

    # post_ids = Like.group(:post_id).order('count_post_id DESC').limit(3).count(:post_id).keys

    to = Time.zone.now.yesterday.at_end_of_day
    from = (to - 7.day).at_beginning_of_day
    post_ids = Post.where(created_at: from...to).limit(5).order('likes_count DESC')
    @rank = post_ids.map{|id| Post.find id}
    @begin = 1.weeks.ago.strftime('%m/%d')
    @end = Time.zone.now.yesterday.strftime('%m/%d')



  end

  def new
    @post = Post.new
  end

  # def create
  #   @post = Post.new(post_params)
  #   respond_to do |format|
  #     if @post.save
  #       format.html { redirect_to @post, notice: '質問を送信しました。' }
  #     else
  #       # 一度目の「確認」ボタンクリック時は、confirmingがセットされていないのsaveでエラーが発生しこっちに来る
  #       # ただし、ここに到達した時点で model の after_validation 後なので、confirmingはセットされている状態で new アクションへ
  #       format.html { render action: 'new' }
  #     end
  #   end
  # end

   def create
    Post.create(title: post_params[:title],subtitle: post_params[:subtitle],content: post_params[:content],service_url: post_params[:service_url],appstore_url: post_params[:appstore_url],googleplay_url: post_params[:googleplay_url],twitter: post_params[:twitter],facebook: post_params[:facebook], image: post_params[:image], image_cache: post_params[:image_cache], category_id: post_params[:category_id],user_id: current_user.id)
  end

  def show
    @post = Post.find(params[:id])
    @posts = Post.where(category_id: @post.category_id).where.not(id: @post.id).order("likes_count DESC").limit(5)
    @comments = @post.comments.includes(:user)
    @likes = Like.all
    @like = Like.where(post_id: params[:post_id])
    @categories = Category.all
    # if @post.relateds
    #   @post.relateds.each do |related|
    #     related = related.related_link
    #     @related_link = MetaInspector.new(related)
    #   end
    # end
  end

  def edit
    @post = Post.find(params[:id])
    @post.image.cache! unless @post.image.blank?
    redirect_to action: "show" unless @post.user_id == current_user.id
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

  def ranking
    @post = Post.includes(:user).all.order("created_at DESC").page(params[:page]).per(8)
    @likes = Like.all
    @like = Like.where(post_id: params[:post_id])
    @categories = Category.all
    # post_ids = Like.group(:post_id).order('count_post_id DESC').limit(12).count(:post_id).keys
    to = Time.zone.now.yesterday.at_end_of_day
    from = (to - 7.day).at_beginning_of_day
    post_ids = Post.where(created_at: from...to).limit(12).order('likes_count DESC')
    @rank = post_ids.map{|id| Post.find id}

    @begin = 1.weeks.ago.strftime('%m/%d')
    @end = Time.now.yesterday.strftime('%m/%d')
  end



  def done
    @post_id = params[:id]
  end

  def privacy
  end

  private
  def post_params
    params.require(:post).permit(:title, :subtitle, :content, :service_url, :appstore_url,:googleplay_url, :twitter, :facebook, :image , :image_cache,  :category_id, :confirming, user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: "index" unless user_signed_in?
  end

end
