class BikeTrailSerializer
  include FastJsonapi::ObjectSerializer
<<<<<<< HEAD
  attributes :name, :distance, :trail_type
  # has_many :messages
=======
  attributes :name, :distance, :trail_type, :locations
>>>>>>> baa0c38efdeeabc83b4f761b64d73139f7bb4c74
  has_many :counters
  has_many :counter_data, through: :counters
  has_many :locations, through: :counters
end
