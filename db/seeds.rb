# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
trail_1 = BikeTrail.create(name: "trail_1" , distance: 4.7, trail_type: "paved-road" )
trail_2 = BikeTrail.create(name: "Alki Trail", distance: 4.6, trail_type: "paved-road" )
trail_3 = BikeTrail.create(name: "trail_3", distance: 6.1, trail_type: "paved-road" )
trail_4 = BikeTrail.create(name: "trail_4", distance: 7.1, trail_type: "paved-road" )
trail_5 = BikeTrail.create(name: "trail_5", distance: 2.0, trail_type: "paved-road" )
# 47.571360, -122.349406
location1 = Location.create(longitude: 45.5380, latitude: 122.6831)
wsb_location = Location.create(longitude: 47.571360, latitude: -122.349406)
location3 = Location.create(longitude: 47.604777, latitude: 122.334661)
location4 = Location.create(longitude: 47.679359, latitude: 122.263684)
location5 = Location.create(longitude: 47.670933, latitude: 122.384743)

counter_1 = Counter.create(name: "Fremont Bridge", location_id: location1.id, bike_trail_id: trail_1.id)
counter_2 = Counter.create(name: "Spokane Street", location_id: wsb_location.id, bike_trail_id: trail_2.id )
counter_3 = Counter.create(name: "2nd Avenue", location_id: location3.id, bike_trail_id: trail_3.id)
counter_4 = Counter.create(name: "Burke Gilman Trail north of NE 70th St Bike and Ped Counter", location_id: location4.id, bike_trail_id: trail_4.id)
counter_5 = Counter.create(name: "W 58th St Greenway at 22nd Ave NW Bike Counter", location_id: location5.id, bike_trail_id: trail_5.id)

message_1 = Message.create(user_name: "user_1", content: "content_1", bike_trail_id: 1)
message_2 = Message.create(user_name: "user_2", content: "content_2", bike_trail_id: 2)
message_3 = Message.create(user_name: "user_3", content: "content_3", bike_trail_id: 3)
message_4 = Message.create(user_name: "user_4", content: "content_4", bike_trail_id: 4)
message_5 = Message.create(user_name: "user_5", content: "content_5", bike_trail_id: 5)

# West Seattle Bridge
#January
jan_url =  "https://data.seattle.gov/resource/upms-nr8w.json?$where=date between '2019-01-01T00:00:00' and '2019-01-31T23:59:59'"
response = RestClient.get(jan_url)
response_body = response.body
json_response = JSON.parse(response_body)
json_response.map do |trip| 
  CounterDatum.create(date_time: trip["date"],
  total_trips: trip["spokane_st_bridge_total"].to_i,
  direction_1: trip["west"].to_i,
  direction_2: trip["east"].to_i,
  counter_id: counter_2.id)
#   byebug
end
# feb_url =  "https://data.seattle.gov/resource/upms-nr8w.json?$where=date between '2019-02-01T00:00:00' and '2019-02-28T23:59:59'"
# response = RestClient.get(feb_url)
# response_body = response.body
# json_response = JSON.parse(response_body)
# json_response.map do |trip| 
#   CounterDatum.create(date_time: trip["date"],
#   total_trips: trip["spokane_st_bridge_total"].to_i,
#   direction_1: trip["west"].to_i,
#   direction_2: trip["east"].to_i,
#   counter_id: counter_2.id)
#   byebug
# end