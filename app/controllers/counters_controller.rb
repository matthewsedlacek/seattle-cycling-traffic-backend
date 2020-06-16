class CountersController < ApplicationController

    def show
        counter = Counter.find(params[:id])
        options = {
            include: [:counter_data]
        }
        render json: CounterSerializer.new(counter, options)
    end
end
