class Admin::FacilityGenresController < ApplicationController
  def new
    @facility_genre = FacilityGenre.new
  end

  def index
    @facility_genres = FacilityGenre.all
  end

  def create
    @facility_genre = FacilityGenre.new(facility_genre_params)
    if @facility_genre.save
      redirect_to admin_facility_genres_path(@facility_genres)
    else
      render :new
    end
  end

  def show
    @gfacility_genre = FacilityGenre.find(params[:id])
  end

  def edit
    @facility_genre = FacilityGenre.find(params[:id])
  end

  def update
    @facility_genre = FacilityGenre.find(params[:id])

    if @facility_genre.update(facility_genre_params)
      redirect_to admin_facility_genres_path(@facility_genres)
    else
      render :edit
    end
  end

  private

  def facility_genre_params
    params.require(:facility_genre).permit(:name)
  end
end
