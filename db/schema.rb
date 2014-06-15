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

ActiveRecord::Schema.define(version: 20140613113245) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: true do |t|
    t.datetime "date"
    t.string   "round"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "result"
    t.integer  "home_team_id"
    t.integer  "away_team_id"
    t.boolean  "published",    default: false
    t.boolean  "finished",     default: false
  end

  create_table "performance_records", force: true do |t|
    t.integer  "player_id"
    t.integer  "game_id"
    t.integer  "minutes",        default: 90
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rating_sum",     default: 0
    t.integer  "goals",          default: 0
    t.integer  "yellow_cards",   default: 0
    t.integer  "red_cards",      default: 0
    t.integer  "rating_count",   default: 0
    t.boolean  "starting",       default: true
    t.boolean  "as_home_player", default: true
  end

  add_index "performance_records", ["game_id"], name: "index_performance_records_on_game_id", using: :btree
  add_index "performance_records", ["player_id"], name: "index_performance_records_on_player_id", using: :btree
  add_index "performance_records", ["starting"], name: "index_performance_records_on_starting", using: :btree

  create_table "players", force: true do |t|
    t.string   "name"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team_id"
    t.integer  "position_id"
    t.integer  "rating_sum",   default: 0
    t.integer  "rating_count", default: 0
    t.integer  "goals",        default: 0
    t.integer  "yellow_cards", default: 0
    t.integer  "red_cards",    default: 0
    t.integer  "minutes",      default: 0
  end

  add_index "players", ["name"], name: "index_players_on_name", using: :btree
  add_index "players", ["team_id", "position_id", "number"], name: "index_players_on_team_id_and_position_id_and_number", using: :btree

  create_table "positions", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "priority"
  end

  create_table "ratings", force: true do |t|
    t.integer  "performance_record_id"
    t.integer  "user_id"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ratings", ["performance_record_id"], name: "index_ratings_on_performance_record_id", using: :btree
  add_index "ratings", ["user_id", "performance_record_id"], name: "index_ratings_on_user_id_and_performance_record_id", unique: true, using: :btree
  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id", using: :btree

  create_table "teams", force: true do |t|
    t.string   "name"
    t.string   "iso_2"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rating_sum",   default: 0
    t.integer  "rating_count", default: 0
    t.integer  "goals",        default: 0
    t.integer  "yellow_cards", default: 0
    t.integer  "red_cards",    default: 0
  end

  add_index "teams", ["name"], name: "index_teams_on_name", using: :btree

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "uid"
    t.string   "image"
    t.string   "provider"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",          default: false
    t.string   "remember_token"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree

end
