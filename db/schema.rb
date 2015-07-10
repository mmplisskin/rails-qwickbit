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

ActiveRecord::Schema.define(version: 20150709234520) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "businesses", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "password_digest"
    t.string   "email"
    t.string   "name"
    t.text     "description"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "phone_number"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "businesses", ["category_id"], name: "index_businesses_on_category_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer  "business_id"
    t.string   "name"
    t.text     "description"
    t.text     "item_address"
    t.decimal  "price"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "items", ["business_id"], name: "index_items_on_business_id", using: :btree

  create_table "rates", force: :cascade do |t|
    t.decimal  "coinbase_rate"
    t.decimal  "bitfinex_rate"
    t.decimal  "okcoin_rate"
    t.decimal  "average_rate"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "wallets", force: :cascade do |t|
    t.string   "wallet_address"
    t.string   "private_key"
    t.string   "name"
    t.decimal  "balance"
    t.integer  "business_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "wallets", ["business_id"], name: "index_wallets_on_business_id", using: :btree

  add_foreign_key "businesses", "categories"
  add_foreign_key "items", "businesses"
  add_foreign_key "wallets", "businesses"
end
