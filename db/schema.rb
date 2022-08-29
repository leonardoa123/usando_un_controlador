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

ActiveRecord::Schema.define(version: 2020_09_20_195713) do

  create_table "cars", force: :cascade do |t|
    t.string "make"
    t.string "model"
    t.string "year"
    t.float "kilometers", default: 0.0
    t.integer "max_trunk_space"
    t.integer "current_trunk_usage", default: 0
    t.integer "current_wheel_usage", default: 0
    t.integer "max_wheel_usage_before_change"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
