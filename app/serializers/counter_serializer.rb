class CounterSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :bike_trail
  has_many :counter_data
  belongs_to :location
end
