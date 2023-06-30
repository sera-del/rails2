# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_06_29_132337) do

  create_table "reservations", force: :cascade do |t|
    t.string "img"
    t.string "accommodation"
    t.text "introduction"
    t.integer "price"
    t.date "check_in"
    t.date "check_out"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.text "accommodation_detail"
    t.integer "room_id"
    t.integer "people"
    t.integer "day"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "accommodation"
    t.text "accommodation_detail"
    t.integer "price"
    t.string "address"
    t.string "img"
    t.date "check_in"
    t.date "check_out"
    t.string "number_of_people"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "people"
    t.integer "room_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
