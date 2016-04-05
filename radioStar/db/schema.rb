# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160220102906) do

  create_table "charts", force: :cascade do |t|
    t.string   "name"
    t.string   "country"
    t.string   "source_url"
    t.integer  "station_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "charts", ["station_id"], name: "index_charts_on_station_id"

  create_table "playlists", force: :cascade do |t|
    t.integer  "show_id"
    t.integer  "chart_id"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "playlists", ["chart_id"], name: "index_playlists_on_chart_id"
  add_index "playlists", ["show_id"], name: "index_playlists_on_show_id"

  create_table "shows", force: :cascade do |t|
    t.string   "name"
    t.string   "timeslot"
    t.float    "compliance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "station_id"
  end

  create_table "songs", force: :cascade do |t|
    t.integer  "playlist_id"
    t.string   "title"
    t.string   "artist"
    t.string   "album"
    t.string   "label"
    t.string   "genre"
    t.datetime "time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "songs", ["playlist_id"], name: "index_songs_on_playlist_id"

  create_table "stations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "chart_id"
    t.integer  "show_id"
    t.string   "station_name"
    t.string   "station_url"
    t.string   "message_of_the_day"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "stations", ["chart_id"], name: "index_stations_on_chart_id"
  add_index "stations", ["show_id"], name: "index_stations_on_show_id"
  add_index "stations", ["user_id"], name: "index_stations_on_user_id"

  create_table "user_shows", force: :cascade do |t|
    t.integer  "show_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_shows", ["show_id"], name: "index_user_shows_on_show_id"
  add_index "user_shows", ["user_id"], name: "index_user_shows_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.integer  "station_id"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["station_id"], name: "index_users_on_station_id"

end
