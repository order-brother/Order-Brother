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

ActiveRecord::Schema.define(version: 2019_06_05_162228) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "business_hours", force: :cascade do |t|
    t.integer "date"
    t.time "start_at"
    t.time "end_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dishes", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.time "prepare_time"
    t.integer "state"
    t.bigint "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_dishes_on_store_id"
  end

  create_table "store_tag", force: :cascade do |t|
    t.string "category", limit: 20, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category"], name: "index_store_tag_on_category", unique: true
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "location"
    t.string "latitude"
    t.string "tel"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_stores_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.decimal "total_price", null: false
    t.text "description"
    t.string "pick_up_time", null: false
    t.integer "state"
    t.bigint "user_id"
    t.bigint "store_id"
    t.boolean "like"
    t.datetime "read_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_transactions_on_store_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "title"
    t.string "name"
    t.string "password"
    t.string "phone"
    t.string "email"
    t.string "role"
    t.text "favorite_store", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "dishes", "stores"
  add_foreign_key "stores", "users"
  add_foreign_key "transactions", "stores"
  add_foreign_key "transactions", "users"
end
