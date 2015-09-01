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

ActiveRecord::Schema.define(version: 20150901211113) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "child_tickets", force: :cascade do |t|
    t.string   "animal_type"
    t.string   "description"
    t.string   "location"
    t.datetime "time"
    t.boolean  "posession"
    t.string   "sex"
    t.boolean  "update"
    t.integer  "good_samaritan_id"
    t.integer  "parent_ticket_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "good_samaritans", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
