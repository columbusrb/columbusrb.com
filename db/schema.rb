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

ActiveRecord::Schema[7.1].define(version: 2020_01_01_135340) do
  create_table "active_admin_comments", force: :cascade do |t|
    t.string "resource_id", null: false
    t.string "resource_type", null: false
    t.string "author_type"
    t.integer "author_id"
    t.text "body"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "namespace"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at", precision: nil
    t.datetime "last_sign_in_at", precision: nil
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "google_token"
    t.string "google_refresh_token"
    t.string "name"
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "board_members", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.string "twitter"
    t.text "bio"
    t.boolean "director", default: false
  end

  create_table "meetings", force: :cascade do |t|
    t.datetime "time", precision: nil
    t.string "format"
    t.index ["time"], name: "index_meetings_on_time"
  end

  create_table "members", force: :cascade do |t|
    t.string "email"
    t.string "md5_hash"
  end

  create_table "speakers", force: :cascade do |t|
    t.integer "meeting_id"
    t.string "name"
    t.string "title"
    t.string "url"
    t.string "twitter"
    t.string "twitter_avatar_url"
    t.index ["meeting_id"], name: "index_speakers_on_meeting_id"
  end

  create_table "videos", force: :cascade do |t|
    t.string "url"
    t.string "name"
    t.string "title"
  end

end
