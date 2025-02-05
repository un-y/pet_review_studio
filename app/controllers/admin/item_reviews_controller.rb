class Admin::ItemReviewsController < ApplicationController
  def new
    @item_post = ItemPost.find(params[:item_post_id])
    @item_reviews = @item_post.item_reviews

    if current_user.nil?
      flash[:alert] = "ログインしてください"
      redirect_to root_path
    else
      @item_review = @item_post.item_reviews.new
    end
  end

  def index
    @item_post = ItemPost.find(params[:item_post_id])
    @item_reviews = @item_post.item_reviews

    logger.debug "Item Post: #{@item_post.inspect}"
    logger.debug "Item Reviews: #{@item_reviews.inspect}"

  end

  def create
    @item_post = ItemPost.find(params[:item_post_id]) 
    @item_review = @item_post.item_reviews.new(item_review_params)
    @item_review.user = current_user

    if @item_review.save
      flash[:notice] = "レビューを投稿しました"
      redirect_to item_post_item_reviews_path(@item_post)
    else
      flash[:alert] = "レビューの投稿に失敗しました"
      render :new
    end
  end

  def edit
    @item_post = ItemPost.find(params[:item_post_id])
    @item_review = @item_post.item_reviews.find(params[:id])
    @item_review.user = current_user
  end  

  def update
    @item_post = ItemPost.find(params[:item_post_id])
    @item_review = @item_post.item_reviews.find(params[:id])
  
    if @item_review.update(item_review_params)
      redirect_to item_post_item_reviews_path(@item_post), notice: 'レビュー情報が更新されました'
    else
      render :edit
    end
  end  

  def destroy
    @item_post = ItemPost.find(params[:item_post_id])
    @item_review = @item_post.item_reviews.find(params[:id])
    @item_review.destroy
    redirect_to item_post_item_reviews_path(@item_post), notice: 'レビューが削除されました'
  end

  private

  def item_review_params
    params.require(:item_review).permit(:evaluation, :comment)
  end
end
