class BikeTrailsController < ApplicationController

    def index
        bike_trails = BikeTrail.all
        render json: bike_trails.to_json()
    end

    def show
        bike_trail = BikeTrail.find(params[:id])
        options = {
            include: [:counters, :counter_data]
        }
        render json: BikeTrailSerializer.new(bike_trail, options)
    end

end
