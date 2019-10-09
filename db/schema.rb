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

ActiveRecord::Schema.define(version: 2019_10_09_100218) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_tansctions", force: :cascade do |t|
    t.float "amount"
    t.bigint "account_id"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_account_tansctions_on_account_id"
  end

  create_table "accounts", force: :cascade do |t|
    t.bigint "user_id"
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.integer "number_of_tickets"
    t.date "date"
    t.bigint "category_id"
    t.string "description"
    t.bigint "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_events_on_category_id"
    t.index ["creator_id"], name: "index_events_on_creator_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "number"
    t.bigint "event_id"
    t.boolean "sold_originally", default: false
    t.boolean "sold_on_marketplace", default: false
    t.boolean "onresell", default: false
    t.float "price"
    t.bigint "purchaser_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_tickets_on_event_id"
    t.index ["purchaser_id"], name: "index_tickets_on_purchaser_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "account_tansctions", "accounts"
  add_foreign_key "accounts", "users"
  add_foreign_key "events", "categories"
  add_foreign_key "events", "users", column: "creator_id"
  add_foreign_key "tickets", "events"
  add_foreign_key "tickets", "users", column: "purchaser_id"
end
