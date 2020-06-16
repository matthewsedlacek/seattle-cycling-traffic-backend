# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_16_033324) do

  create_table "bike_trails", force: :cascade do |t|
    t.string "name"
    t.float "distance"
    t.string "trail_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "counter_data", force: :cascade do |t|
    t.datetime "date_time"
    t.integer "total_trips"
    t.integer "direction_1"
    t.integer "direction_2"
    t.integer "counter_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["counter_id"], name: "index_counter_data_on_counter_id"
  end

  create_table "counters", force: :cascade do |t|
    t.string "name"
    t.integer "location_id", null: false
    t.integer "bike_trail_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bike_trail_id"], name: "index_counters_on_bike_trail_id"
    t.index ["location_id"], name: "index_counters_on_location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.float "longitude"
    t.float "latitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string "user_name"
    t.string "content"
    t.integer "bike_trail_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bike_trail_id"], name: "index_messages_on_bike_trail_id"
  end

  add_foreign_key "counter_data", "counters"
  add_foreign_key "counters", "bike_trails"
  add_foreign_key "counters", "locations"
  add_foreign_key "messages", "bike_trails"
end
