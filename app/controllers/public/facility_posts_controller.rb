class Public::FacilityPostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @facility_post = FacilityPost.new
    @facility_genres = FacilityGenre.all
    @pet_genres = PetGenre.all
  end


  def index
    @facility_posts = FacilityPost.includes(:item_genre, :pet_genres)
  
    if params[:query].present?
      @facility_posts = @facility_posts.where('facility_posts.name LIKE ?', "%#{params[:query]}%")
    end
  
    if params[:facility_genre_id].present?
      @facility_posts = @facility_posts.where(facility_genre_id: params[:facility_genre_id])
    end
  
    if params[:pet_genre_id].present?
      @facility_posts = @facility_posts.joins(:pet_genres).where(pet_genres: { id: params[:pet_genre_id] })
    end
  
    @facility_posts = @facility_posts.all
  end
  
  def show
    @facility_post = FacilityPost.find(params[:id])
    @facility_genres = FacilityGenre.all
    @pet_genres = PetGenre.all
    @facility_review = FacilityReview.all
    @facility_reviews = @facility_post.facility_reviews
  end
  
  def create
    @facility_post = FacilityPost.new(facility_post_params)
    @facility_post.user = current_user

    if @facility_post.save
      if params[:facility_post][:pet_genre_ids].present?
        @facility_post.pet_genres = PetGenre.where(id: params[:facility_post][:pet_genre_ids])
      end
      redirect_to @facility_post
    else
      Rails.logger.debug "Facility post errors: #{@facility_post.errors.full_messages}"
      render :new
    end
  end

  def edit
    @facility_post = FacilityPost.find(params[:id])
    @facility_genres = FacilityGenre.all
    @pet_genres = PetGenre.all
  end  

  def update
    @facility_post = FacilityPost.find(params[:id])
    if @facility_post.update(facility_post_params)
      if params[:facility_post][:pet_genre_ids].present?
        @facility_post.pet_genres = PetGenre.where(id: params[:facility_post][:pet_genre_ids])
      end
      redirect_to @facility_post, notice: "投稿が更新されました"
    else
      Rails.logger.debug "Facility post errors: #{@facility_post.errors.full_messages}"
      render :edit
    end
  end

  def destroy
    @facility_post = FacilityPost.find(params[:id])
    @facility_post.destroy
    redirect_to facility_posts_path
  end

  private

  def facility_post_params
    params.require(:facility_post).permit(
      :name, 
      :facility_genre_id, 
      :address, 
      :prices, 
      :introduction,
      :opening_time,
      :closing_time,
      pet_genre_ids: []
    )
  end
end