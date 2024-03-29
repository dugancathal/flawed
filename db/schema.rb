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

ActiveRecord::Schema.define(version: 20130405095417) do

  create_table "flaws", force: true do |t|
    t.integer  "site_id"
    t.integer  "user_id"
    t.integer  "refreshes_every"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "flaws", ["site_id"], name: "index_flaws_on_site_id"
  add_index "flaws", ["user_id"], name: "index_flaws_on_user_id"

  create_table "sites", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "profile_pic"
    t.string   "username"
    t.string   "password_digest"
  end

end
