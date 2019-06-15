# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).

ActiveRecord::Schema.define(version: 2019_06_15_070211) do
  enable_extension "plpgsql"

  create_table "business_hours", force: :cascade do |t|
    t.integer "date"
    t.time "start_at"
    t.time "end_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "store_id"
    t.index ["store_id"], name: "index_business_hours_on_store_id"
  end

  create_table "dish_tags", force: :cascade do |t|
    t.string "category", limit: 20, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category"], name: "index_dish_tags_on_category", unique: true
  end

  create_table "dish_tags_dishes", id: false, force: :cascade do |t|
    t.bigint "dish_id"
    t.bigint "dish_tag_id"
    t.index ["dish_id"], name: "index_dish_tags_dishes_on_dish_id"
    t.index ["dish_tag_id"], name: "index_dish_tags_dishes_on_dish_tag_id"
  end

  create_table "dishes", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "price"
    t.integer "prepare_time"
    t.integer "state", default: 1
    t.bigint "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "main_img"
    t.index ["store_id"], name: "index_dishes_on_store_id"
  end

  create_table "store_tags", force: :cascade do |t|
    t.string "category", limit: 20, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category"], name: "index_store_tags_on_category", unique: true
  end

  create_table "store_tags_stores", id: false, force: :cascade do |t|
    t.bigint "store_id"
    t.bigint "store_tag_id"
    t.index ["store_id"], name: "index_store_tags_stores_on_store_id"
    t.index ["store_tag_id"], name: "index_store_tags_stores_on_store_tag_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name", limit: 20, default: "", null: false
    t.text "description"
    t.string "location"
    t.string "latitude"
    t.string "tel", limit: 10, default: "", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "main_img"
    t.index ["user_id"], name: "index_stores_on_user_id"
  end

  create_table "transaction_items", force: :cascade do |t|
    t.bigint "transaction_id"
    t.bigint "dish_id"
    t.integer "dish_count", null: false
    t.decimal "item_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dish_id"], name: "index_transaction_items_on_dish_id"
    t.index ["transaction_id"], name: "index_transaction_items_on_transaction_id"
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
    t.integer "transaction_number"
    t.index ["store_id"], name: "index_transactions_on_store_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "title"
    t.string "name", limit: 20, default: "", null: false
    t.string "password"
    t.string "phone", limit: 15, default: "", null: false
    t.string "email"
    t.string "role"
    t.text "favorite_store", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["phone"], name: "index_users_on_phone", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "business_hours", "stores"
  add_foreign_key "dishes", "stores"
  add_foreign_key "stores", "users"
  add_foreign_key "transaction_items", "dishes"
  add_foreign_key "transaction_items", "transactions"
  add_foreign_key "transactions", "stores"
  add_foreign_key "transactions", "users"
end