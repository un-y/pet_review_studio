class Admin::ItemPostsController < ApplicationController
  def new
    @item_post = ItemPost.new
    @item_genres = ItemGenre.all
    @pet_genres = PetGenre.all
  end

  def index
    @item_posts = ItemPost.includes(:item_genre, :pet_genres).all
  end

  def show
    @item_post = ItemPost.find(params[:id])
    @item_genres = ItemGenre.all
    @pet_genres = PetGenre.all
    @item_reviews = @item_post.item_reviews
  end

  def create
    @item_post = ItemPost.new(item_post_params)
    @item_post.user = current_user
    if @item_post.save
      if params[:item_post][:pet_genre_ids].present?
        @item_post.pet_genres = PetGenre.where(id: params[:item_post][:pet_genre_ids])
      end
      redirect_to @item_post
    else
      Rails.logger.debug "Item post errors: #{@item_post.errors.full_messages}"
      render :new
    end
  end

  def edit
    @item_post = ItemPost.find(params[:id])
    @item_genres = ItemGenre.all
    @pet_genres = PetGenre.all
  end  

  def update
    @item_post = ItemPost.find(params[:id])
    if @item_post.update(item_post_params)
      redirect_to @item_post, notice: '商品情報が更新されました'
    else
      @item_genres = ItemGenre.all
      @pet_genres = PetGenre.all
      render :edit
    end
  end

  def destroy
    @item_post = ItemPost.find(params[:id])
    @item_post.destroy!
    redirect_to item_posts_path
  end

  private

  def item_post_params
    params.require(:item_post).permit(:name, :item_genre_id, :prices, :introduction, pet_genre_ids: [])
  end
end