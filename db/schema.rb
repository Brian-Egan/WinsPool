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

ActiveRecord::Schema.define(version: 20130912205813) do

  create_table "drafts", force: true do |t|
    t.integer  "round"
    t.integer  "pick"
    t.integer  "user_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "overall_pick"
  end

  create_table "members", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pick_orders", force: true do |t|
    t.integer  "pick"
    t.integer  "teams_2"
    t.integer  "teams_3"
    t.integer  "teams_4"
    t.integer  "teams_5"
    t.integer  "teams_6"
    t.integer  "teams_7"
    t.integer  "teams_8"
    t.integer  "teams_9"
    t.integer  "teams_10"
    t.integer  "teams_11"
    t.integer  "teams_12"
    t.integer  "teams_13"
    t.integer  "teams_14"
    t.integer  "teams_15"
    t.integer  "teams_16"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedules", force: true do |t|
    t.integer  "week"
    t.datetime "date"
    t.integer  "visitor_id"
    t.integer  "home_id"
    t.integer  "visitor_score"
    t.integer  "home_score"
    t.integer  "winning_team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "city_abr"
    t.string   "city"
    t.string   "name"
    t.integer  "wins"
    t.integer  "losses"
    t.integer  "ties"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "taken"
  end

  create_table "users", force: true do |t|
    t.string   "owner"
    t.integer  "draft_order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "password_digest"
    t.string   "encrypted_password", default: "", null: false
    t.integer  "sign_in_count",      default: 0,  null: false
    t.datetime "last_sign_in_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
