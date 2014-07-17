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

ActiveRecord::Schema.define(version: 20140716202524) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collections", force: true do |t|
    t.integer "user_id"
    t.integer "wine_id"
    t.string  "collection_name"
  end

  add_index "collections", ["user_id"], name: "index_collections_on_user_id", using: :btree
  add_index "collections", ["wine_id"], name: "index_collections_on_wine_id", using: :btree

  create_table "users", force: true do |t|
    t.string "email"
    t.string "password_digest"
    t.string "token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  create_table "wines", force: true do |t|
    t.string  "wine_fruit_taste"
    t.string  "wine_sweetness"
    t.string  "wine_body"
    t.string  "wine_vintage"
    t.string  "wine_abv"
    t.string  "wine_overall_rating"
    t.string  "wine_type"
    t.integer "collection_id"
    t.string  "wine_image"
    t.string  "wine_name"
  end

  add_index "wines", ["collection_id"], name: "index_wines_on_collection_id", using: :btree

end
