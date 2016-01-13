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

ActiveRecord::Schema.define(version: 20160113044846) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string   "name",                       null: false
    t.string   "zip_code",                   null: false
    t.string   "state",            limit: 2, null: false
    t.string   "address_line_one",           null: false
    t.string   "address_line_two"
    t.datetime "begins_at",                  null: false
    t.datetime "ends_at"
    t.integer  "host_id",                    null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "guests", force: :cascade do |t|
    t.string   "first_name",  null: false
    t.string   "last_name"
    t.integer  "event_id",    null: false
    t.integer  "table_id"
    t.integer  "seat_number"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
  end

  create_table "pairings", force: :cascade do |t|
    t.integer  "guest_id",   null: false
    t.integer  "pair_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "pairings", ["guest_id"], name: "index_pairings_on_guest_id", using: :btree
  add_index "pairings", ["pair_id"], name: "index_pairings_on_pair_id", using: :btree

  create_table "tables", force: :cascade do |t|
    t.integer  "number"
    t.integer  "number_of_seats", null: false
    t.integer  "event_id",        null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",    null: false
    t.string   "last_name",     null: false
    t.string   "email",         null: false
    t.string   "username",      null: false
    t.string   "password_hash", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
