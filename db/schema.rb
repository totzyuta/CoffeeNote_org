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

ActiveRecord::Schema.define(version: 20141231065003) do

  create_table "notes", force: :cascade do |t|
    t.integer  "uid"
    t.string   "blendName",     limit: 50, null: false
    t.string   "origin",        limit: 50, null: false
    t.string   "place",         limit: 50, null: false
    t.integer  "roast"
    t.integer  "dark"
    t.integer  "body"
    t.integer  "flavor"
    t.integer  "acidity"
    t.integer  "sweetness"
    t.integer  "cleancup"
    t.integer  "aftertaste"
    t.integer  "overall"
    t.text     "comment"
    t.integer  "public"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "coffee_image1"
    t.datetime "date"
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",    null: false
    t.string   "uid",         null: false
    t.string   "nickname",    null: false
    t.string   "image_url",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "profile"
    t.string   "fav_roaster"
    t.index ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true
  end

end
