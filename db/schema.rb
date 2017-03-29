# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170329230017) do

  create_table "cars", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "make"
    t.string   "model"
    t.string   "year"
    t.string   "trim"
    t.string   "style"
    t.string   "VIN"
    t.integer  "seats"
    t.integer  "mileage"
    t.string   "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cars_on_user_id"
  end

  create_table "passengers", force: :cascade do |t|
    t.integer  "trip_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_passengers_on_trip_id"
    t.index ["user_id"], name: "index_passengers_on_user_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string   "dStreetNum"
    t.string   "dStreet"
    t.string   "dCity"
    t.string   "dState"
    t.string   "dZip"
    t.string   "aStreetNum"
    t.string   "aStreet"
    t.string   "aCity"
    t.string   "aState"
    t.string   "aZip"
    t.datetime "dDate"
    t.datetime "aDate"
    t.time     "duration"
    t.float    "price"
    t.integer  "car_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_trips_on_car_id"
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "f_name"
    t.string   "l_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "street_num"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zipCode"
    t.string   "phone"
    t.date     "bday"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
