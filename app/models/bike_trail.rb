class BikeTrail < ApplicationRecord
    has_many :counters
    has_many :counter_data, through: :counters
    has_many :locations, through: :counters
end
