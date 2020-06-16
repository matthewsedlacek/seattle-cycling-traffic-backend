class Counter < ApplicationRecord
  belongs_to :location
  belongs_to :bike_trail
  has_many :counter_data
end
