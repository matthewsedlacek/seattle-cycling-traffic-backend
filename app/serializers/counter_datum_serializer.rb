class CounterDatumSerializer
  include FastJsonapi::ObjectSerializer
  attributes :date_time, :total_trips, :direction_1, :direction_2
  belongs_to :counter
end
