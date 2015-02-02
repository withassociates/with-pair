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

ActiveRecord::Schema.define(version: 20140610052642) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.integer  "session_id"
    t.string   "name",         null: false
    t.string   "skype"
    t.string   "email",        null: false
    t.text     "project",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "cancelled_at"
  end

  add_index "bookings", ["cancelled_at"], name: "index_bookings_on_cancelled_at", using: :btree
  add_index "bookings", ["session_id", "cancelled_at"], name: "index_bookings_on_session_id_and_cancelled_at", using: :btree
  add_index "bookings", ["session_id"], name: "index_bookings_on_session_id", using: :btree

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "skills"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "screenhero_email"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer  "person_id"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["ends_at"], name: "index_sessions_on_ends_at", using: :btree
  add_index "sessions", ["person_id", "starts_at", "ends_at"], name: "index_sessions_on_person_id_and_starts_at_and_ends_at", using: :btree
  add_index "sessions", ["person_id"], name: "index_sessions_on_person_id", using: :btree
  add_index "sessions", ["starts_at"], name: "index_sessions_on_starts_at", using: :btree

end
