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

ActiveRecord::Schema.define(version: 2022_05_15_043339) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hikes", force: :cascade do |t|
    t.string "name"
    t.float "length_miles"
    t.boolean "open"
    t.bigint "park_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["park_id"], name: "index_hikes_on_park_id"
  end

  create_table "parks", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.float "fee"
    t.boolean "national_park_pass"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "hikes", "parks"
end
