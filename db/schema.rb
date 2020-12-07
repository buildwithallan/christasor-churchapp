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

ActiveRecord::Schema.define(version: 2020_12_06_215321) do

  create_table "memberships", force: :cascade do |t|
    t.string "member_id"
    t.string "title"
    t.string "firstname"
    t.string "lastname"
    t.string "othernames"
    t.string "gender"
    t.date "date_of_birth"
    t.integer "primary_phone_number"
    t.integer "other_phone_number"
    t.string "email"
    t.string "hometown"
    t.string "residential_location"
    t.string "occupation"
    t.string "marital_status"
    t.string "work_place"
    t.integer "year_joining_church"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
