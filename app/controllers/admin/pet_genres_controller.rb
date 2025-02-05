class Admin::PetGenresController < ApplicationController
  def new
    @pet_genre = PetGenre.new
  end

  def index
    @pet_genres = PetGenre.all
  end

  def create
    @pet_genre = PetGenre.new(pet_genre_params)
    if @pet_genre.save
      redirect_to admin_pet_genres_path(@pet_genres)
    else
      render :new
    end
  end

  def show
    @pet_genre = PetGenre.find(params[:id])
  end

  def edit
    @pet_genre = PetGenre.find(params[:id])
  end

  def update
    @pet_genre = PetGenre.find(params[:id])

    if @pet_genre.update(pet_genre_params)
      redirect_to admin_pet_genres_path(@pet_genres)
    else
      render :edit
    end
  end

  private

  def pet_genre_params
    params.require(:pet_genre).permit(:name)
  end
end