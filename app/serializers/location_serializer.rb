class LocationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :longitude, :latitude
  has_one :counter
  belongs_to :bike_trail, through: :counter
end
