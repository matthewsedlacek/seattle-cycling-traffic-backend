
#Trails 
burke_gilman = BikeTrail.create(name: "Burke Gilman", distance:	20.0, trail_type:	"Paved with soft surface shoulder")
elliot_bay = BikeTrail.create(name: "Elliott Bay", distance: 5.0	, trail_type:	"Paved Multi-use Path")
ship_canal = BikeTrail.create(name: "Ship Canal", distance: 1.9	, trail_type:	"Paved Walkway")
mts = BikeTrail.create(name: "Mountain to Sound", distance: 3.9	, trail_type:	"Paved Walkway")
wsb = BikeTrail.create(name: "Alki Trail + West Seattle Bride", distance: 5.0	, trail_type:	"Paved Urban Trail")
cs = BikeTrail.create(name: "Chief Sealth", distance: 4.3	, trail_type:	"Paved Urban Trail")
second_ave = BikeTrail.create(name: "2nd Ave", distance: 2.0	, trail_type:	"Paved Protected Bike Lane")
golden_gardens = BikeTrail.create(name: "Golden Gardens", distance: 3.3	, trail_type:	"Paved Multi-Use Trail and Greenway")
bryant_greenway = BikeTrail.create(name: "Bryant Greenway", distance: 2.2	, trail_type:	"Neighborhood Greenway")
broadway = BikeTrail.create(name: "Broadway Bike Lane", distance: 1.5	, trail_type:	"Paved Protected Bike Lane")

#Locations
burke_gilman_location = Location.create(longitude: 47.679359, latitude: -122.263684)
elliot_bay_location = Location.create(longitude: 47.618844, latitude: -122.359963)
ship_canal_location = Location.create(longitude: 45.5380, latitude: -122.6831)
mts_location = Location.create(longitude: 47.590748, latitude: -122.288702)
wsb_location = Location.create(longitude: 47.571422, latitude: -122.349617)
cs_location =  Location.create(longitude: 47.527844, latitude: -122.280171)
second_ave_location = Location.create(longitude: 47.604777, latitude: -122.334661)
golden_gardens_location = Location.create(longitude: 47.670933, latitude: -122.384743)
bryant_greenway_location = Location.create(longitude: 47.673886, latitude: -122.285766)
broadway_location = Location.create(longitude: 47.613500, latitude: -122.320842)
#Counters
burke_gilman_counter = Counter.create(name: "Burke Gilman Trail north of NE 70th St Bike and Ped Counter", location_id: 1, bike_trail_id: 1)
elliot_bay_counter = Counter.create(name: "Elliott Bay Trail in Myrtle Edwards Park Bike Counter", location_id: 2, bike_trail_id: 2)
ship_canal_counter = Counter.create(name: "Fremont Bridge", location_id: 3, bike_trail_id: 3 )
mts_counter = Counter.create(name: "MTS Trail west of I-90 Bridge Bike Counter", location_id: 4, bike_trail_id: 4)
wsb_counter = Counter.create(name: "Spokane Street", location_id: 5, bike_trail_id: 5 )
cs_counter = Counter.create(name: "Chief Sealth Trail North of Thistle Bike Counter", location_id: 6, bike_trail_id: 6)
second_ave_counter = Counter.create(name: "2nd Avenue", location_id: 7, bike_trail_id: 7)
golden_gardens_counter = Counter.create(name: "W 58th St Greenway at 22nd Ave NW Bike Counter", location_id: 8, bike_trail_id: 8)
bryant_greenway_counter = Counter.create(name: "39th Ave NE Greenway at NE 62nd St Bike Counter", location_id: 9, bike_trail_id: 9)
broadway_counter = Counter.create(name: "Broadway Cycle Track North of E Union St Bike Counter", location_id: 10, bike_trail_id: 10)
#messages
message_1 = Message.create(user_name: "user_1", content: "content_1", bike_trail_id: 1)
message_2 = Message.create(user_name: "user_2", content: "content_2", bike_trail_id: 2)
message_3 = Message.create(user_name: "user_3", content: "content_3", bike_trail_id: 3)
message_4 = Message.create(user_name: "user_4", content: "content_4", bike_trail_id: 4)
message_5 = Message.create(user_name: "user_5", content: "content_5", bike_trail_id: 5)
#CounterData
# burke_gilman_counter
# May 2020
burke_gilman_url =  "https://data.seattle.gov/resource/2z5v-ecg8.json?$where=date between '2020-05-01T00:00:00' and '2020-05-31T23:59:59'"
burke_gilman_response = RestClient.get(burke_gilman_url)
burke_gilman_response_body = burke_gilman_response.body
burke_gilman_json_response = JSON.parse(burke_gilman_response_body)
burke_gilman_json_response.map do |trip| 
  CounterDatum.create(date_time: trip["date"],
  total_trips: (trip["bike_north"].to_i) + (trip["bike_south"].to_i),
  direction_1: trip["bike_north"].to_i,
  direction_2: trip["bike_south"].to_i,
  counter_id: burke_gilman_counter.id)
end
# elliot_bay_counter
# May 2020
# https://data.seattle.gov/resource/4qej-qvrz.json
elliot_bay_url =  "https://data.seattle.gov/resource/4qej-qvrz.json?$where=date between '2020-05-01T00:00:00' and '2020-05-31T23:59:59'"
elliot_bay_response = RestClient.get(elliot_bay_url)
elliot_bay_response_body = elliot_bay_response.body
elliot_bay_json_response = JSON.parse(elliot_bay_response_body)
elliot_bay_json_response.map do |trip| 
  CounterDatum.create(date_time: trip["date"],
  total_trips: (trip["bike_north"].to_i) + (trip["bike_south"].to_i),
  direction_1: trip["bike_north"].to_i,
  direction_2: trip["bike_south"].to_i,
  counter_id: elliot_bay_counter.id)
end
# ship_canal_counter
# May 2020
# https://data.seattle.gov/resource/65db-xm6k.json
ship_canal_url =  "https://data.seattle.gov/resource/65db-xm6k.json?$where=date between '2020-05-01T00:00:00' and '2020-05-31T23:59:59'"
ship_canal_response = RestClient.get(ship_canal_url)
ship_canal_response_body = ship_canal_response.body
ship_canal_json_response = JSON.parse(ship_canal_response_body)
ship_canal_json_response.map do |trip| 
  CounterDatum.create(date_time: trip["date"],
  total_trips: trip["fremont_bridge"].to_i,
  direction_1: trip["fremont_bridge_sb"].to_i,
  direction_2: trip["fremont_bridge_nb"].to_i,
  counter_id: ship_canal_counter.id)
end
# mts_counter
# April 2020
# https://data.seattle.gov/resource/u38e-ybnc.json
mts_url =  "https://data.seattle.gov/resource/u38e-ybnc.json?$where=date between '2020-04-01T00:00:00' and '2020-04-30T23:59:59'"
mts_response = RestClient.get(mts_url)
mts_response_body = mts_response.body
mts_json_response = JSON.parse(mts_response_body)
mts_json_response.map do |trip| 
  CounterDatum.create(date_time: trip["date"],
  total_trips: (trip["bike_east"].to_i) + (trip["bike_west"].to_i),
  direction_1: trip["bike_east"].to_i,
  direction_2: trip["bike_west"].to_i,
  counter_id: mts_counter.id)
end
# wsb_counter
# May 2020
wsb_url =  "https://data.seattle.gov/resource/upms-nr8w.json?$where=date between '2020-05-01T00:00:00' and '2020-05-31T23:59:59'"
wsb_response = RestClient.get(wsb_url)
wsb_response_body = wsb_response.body
wsb_json_response = JSON.parse(wsb_response_body)
wsb_json_response.map do |trip| 
  CounterDatum.create(date_time: trip["date"],
  total_trips: trip["spokane_st_bridge_total"].to_i,
  direction_1: trip["west"].to_i,
  direction_2: trip["east"].to_i,
  counter_id: wsb_counter.id)
end
# cs_counter
# November 2015
# https://data.seattle.gov/resource/uh8h-bme7.json
cs_url =  "https://data.seattle.gov/resource/uh8h-bme7.json?$where=date between '2015-11-01T00:00:00' and '2015-11-30T23:59:59'"
cs_response = RestClient.get(cs_url)
cs_response_body = cs_response.body
cs_json_response = JSON.parse(cs_response_body)
cs_json_response.map do |trip| 
  CounterDatum.create(date_time: trip["date"],
  total_trips: (trip["bike_north"].to_i) + (trip["bike_south"].to_i),
  direction_1: trip["bike_north"].to_i,
  direction_2: trip["bike_south"].to_i,
  counter_id: cs_counter.id)
end
# second_ave_counter
# April 2020
# https://data.seattle.gov/resource/avwm-i8ym.json
second_ave_url =  "https://data.seattle.gov/resource/avwm-i8ym.json?$where=date between '2020-04-01T00:00:00' and '2020-04-30T23:59:59'"
second_ave_response = RestClient.get(second_ave_url)
second_ave_response_body = second_ave_response.body
second_ave_json_response = JSON.parse(second_ave_response_body)
second_ave_json_response.map do |trip| 
  CounterDatum.create(date_time: trip["date"],
  total_trips: trip["_2nd_ave_cycletrack"].to_i,
  direction_1: trip["nb"].to_i,
  direction_2: trip["sb"].to_i,
  counter_id: second_ave_counter.id)
end
# golden_gardens_counter
# April 2020
# https://data.seattle.gov/resource/47yq-6ugv.json
golden_gardens_url =  "https://data.seattle.gov/resource/47yq-6ugv.json?$where=date between '2020-04-01T00:00:00' and '2020-04-30T23:59:59'"
golden_gardens_response = RestClient.get(golden_gardens_url)
golden_gardens_response_body = golden_gardens_response.body
golden_gardens_json_response = JSON.parse(golden_gardens_response_body)
golden_gardens_json_response.map do |trip| 
  CounterDatum.create(date_time: trip["date"],
  total_trips: trip["nw_58th_st_greenway_st_22nd_ave_nw_total"].to_i,
  direction_1: trip["east"].to_i,
  direction_2: trip["west"].to_i,
  counter_id: golden_gardens_counter.id)
end
# bryant_greenway_counter
# May 2018
# https://data.seattle.gov/resource/3h7e-f49s.json
bryant_greenway_url =  "https://data.seattle.gov/resource/3h7e-f49s.json?$where=date between '2018-05-01T00:00:00' and '2018-05-31T23:59:59'"
bryant_greenway_response = RestClient.get(bryant_greenway_url)
bryant_greenway_response_body = bryant_greenway_response.body
bryant_greenway_json_response = JSON.parse(bryant_greenway_response_body)
bryant_greenway_json_response.map do |trip| 
  CounterDatum.create(date_time: trip["date"],
  total_trips: trip["_39th_ave_ne_greenway_at_ne_62nd_st_total"].to_i,
  direction_1: trip["north"].to_i,
  direction_2: trip["south"].to_i,
  counter_id: bryant_greenway_counter.id)
end
# broadway_counter
# April 2020
# https://data.seattle.gov/resource/j4vh-b42a.json
broadway_url =  "https://data.seattle.gov/resource/j4vh-b42a.json?$where=date between '2020-04-01T00:00:00' and '2020-04-30T23:59:59'"
broadway_response = RestClient.get(broadway_url)
broadway_response_body = broadway_response.body
broadway_json_response = JSON.parse(broadway_response_body)
broadway_json_response.map do |trip| 
  CounterDatum.create(date_time: trip["date"],
  total_trips: trip["broadway_cycle_track_north_of_e_union_st_total"].to_i,
  direction_1: trip["nb"].to_i,
  direction_2: trip["sb"].to_i,
  counter_id: broadway_counter.id)
end
