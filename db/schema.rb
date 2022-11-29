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

ActiveRecord::Schema[7.0].define(version: 2022_11_29_153308) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "location"
    t.datetime "date_details"
    t.float "price"
    t.string "venue"
    t.string "url"
    t.string "category"
    t.float "lng"
    t.float "lat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
  end

  create_table "favorite_groups", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "favorite_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["favorite_id"], name: "index_favorite_groups_on_favorite_id"
    t.index ["group_id"], name: "index_favorite_groups_on_group_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_favorites_on_event_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "group_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_group_users_on_group_id"
    t.index ["user_id"], name: "index_group_users_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "handle"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "favorite_groups", "favorites"
  add_foreign_key "favorite_groups", "groups"
  add_foreign_key "favorites", "events"
  add_foreign_key "favorites", "users"
  add_foreign_key "group_users", "groups"
  add_foreign_key "group_users", "users"
end
