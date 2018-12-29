class CuisinesController < ApplicationController
    before_action :set_cuisine

    def index
        @cuisines = Cuisine.all
    end
    def show
    end
    # half-baked
    def set_cuisine
        @cuisine = Cuisine.find(params[:id])
    end
end
