class Admin::ItemGenresController < ApplicationController
  def new
    @item_genre = ItemGenre.new
  end

  def index
    @item_genres = ItemGenre.all
  end

  def create
    @item_genre = ItemGenre.new(item_genre_params)
    if @item_genre.save
      redirect_to admin_item_genres_path(@item_genres)
    else
      render :new
    end
  end

  def show
    @item_genre = ItemGenre.find(params[:id])
  end

  def edit
    @item_genre = ItemGenre.find(params[:id])
  end

  def update
    @item_genre = ItemGenre.find(params[:id])

    if @item_genre.update(item_genre_params)
      redirect_to admin_item_genres_path(@item_genres)
    else
      render :edit
    end
  end

  private

  def item_genre_params
    params.require(:item_genre).permit(:name)
  end
end
