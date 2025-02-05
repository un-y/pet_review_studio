class Admin::DashboardsController < ApplicationController
  before_action :authenticate_admin!
    def index
        @users = User.all
        @pet_genres = PetGenre.all
    end
end
