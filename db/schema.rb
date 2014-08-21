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

ActiveRecord::Schema.define(version: 20140813070319) do

  create_table "daily_habits.rake", force: true do |t|
    t.date    "date"
    t.integer "user_id"
    t.integer "habit_id"
    t.boolean "completed", default: false
  end

  add_index "daily_habits.rake", ["user_id", "date", "completed"], name: "index_daily_habits_on_user_id_and_date_and_completed"

  create_table "habits", force: true do |t|
    t.string   "task"
    t.integer  "user_id"
    t.integer  "total_points"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category"
  end

  add_index "habits", ["category"], name: "index_habits_on_category"
  add_index "habits", ["user_id", "created_at"], name: "index_habits_on_user_id_and_created_at_and_complete"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
