class BikeTrailSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :distance, :trail_type, :locations
  has_many :counters
  has_many :counter_data, through: :counters
  has_many :locations, through: :counters
end
