class BikeTrailSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :distance, :trail_type
  has_many :counters
  has_many :counter_data, through: :counters
end
