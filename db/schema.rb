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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120902164635) do

  create_table "meetings", :force => true do |t|
    t.datetime "time"
    t.string   "format"
    t.string   "group_name"
  end

  add_index "meetings", ["time"], :name => "index_meetings_on_time"

  create_table "members", :force => true do |t|
    t.string "email"
    t.string "md5_hash"
  end

  create_table "speakers", :force => true do |t|
    t.integer "meeting_id"
    t.string  "name"
    t.string  "title"
    t.string  "url"
  end

  add_index "speakers", ["meeting_id"], :name => "index_speakers_on_meeting_id"

end
