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

ActiveRecord::Schema.define(version: 20140828150631) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "meetings", force: true do |t|
    t.datetime "time"
    t.string   "format"
  end

  add_index "meetings", ["time"], name: "index_meetings_on_time", unique: true, using: :btree

  create_table "members", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "github"
    t.string   "twitter"
    t.string   "website"
    t.text     "bio"
    t.boolean  "admin",           default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "members", ["email"], name: "index_members_on_email", unique: true, using: :btree
  add_index "members", ["remember_token"], name: "index_members_on_remember_token", using: :btree

  create_table "presentations", force: true do |t|
    t.integer  "member_id"
    t.integer  "meeting_id"
    t.string   "title"
    t.string   "slides"
    t.string   "video"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "presentations", ["meeting_id"], name: "index_presentations_on_meeting_id", using: :btree
  add_index "presentations", ["member_id"], name: "index_presentations_on_member_id", using: :btree

end
