class Admin::FacilityReviewsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @facility_post = FacilityPost.find(params[:facility_post_id])
    @facility_reviews = @facility_post.facility_reviews

    if current_user.nil?
      flash[:alert] = "ログインしてください"
      redirect_to root_path
    else
      @facility_review = @facility_post.facility_reviews.new
    end
  end

  def index
    @facility_post = FacilityPost.find(params[:facility_post_id])
    @facility_reviews = @facility_post.facility_reviews

    logger.debug "Facility Post: #{@facility_post.inspect}"
    logger.debug "Facility Reviews: #{@facility_reviews.inspect}"

  end

  def create
    @facility_post = FacilityPost.find(params[:facility_post_id]) 
    @facility_review = @facility_post.facility_reviews.new(facility_review_params)
    @facility_review.user = current_user

    if @facility_review.save
      flash[:notice] = "レビューを投稿しました"
      redirect_to facility_post_facility_reviews_path(@facility_post)
    else
      flash[:alert] = "レビューの投稿に失敗しました"
      render :new
    end
  end

  def edit
    @facility_post = FacilityPost.find(params[:facility_post_id])
    @facility_review = @facility_post.facility_reviews.find(params[:id])
    @facility_review.user = current_user
  end  

  def update
    @facility_post = FacilityPost.find(params[:facility_post_id])
    @facility_review = @facility_post.facility_reviews.find(params[:id])
  
    if @facility_review.update(facility_review_params)
      redirect_to facility_post_facility_reviews_path(@facility_post), notice: 'レビュー情報が更新されました'
    else
      render :edit
    end
  end  

  def destroy
    @facility_post = FacilityPost.find(params[:facility_post_id])
    @facility_review = @facility_post.facility_reviews.find(params[:id])
    @facility_review.destroy
    redirect_to facility_post_facility_reviews_path(@facility_post), notice: 'レビューが削除されました'
  end

  private

  def facility_review_params
    params.require(:facility_review).permit(:evaluation, :comment)
  end
end
