class CounterDataController < ApplicationController

    def index
        counter_data = CounterDatum.all
        render json: counter_data.to_json()
    end

end
