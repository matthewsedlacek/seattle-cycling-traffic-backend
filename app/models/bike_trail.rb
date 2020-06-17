class BikeTrail < ApplicationRecord
    has_many :messages
    has_many :counters
    has_many :counter_data, through: :counters
end
