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

ActiveRecord::Schema[7.1].define(version: 2023_11_30_033314) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "app_categories", force: :cascade do |t|
    t.bigint "app_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_app_categories_on_app_id"
    t.index ["category_id"], name: "index_app_categories_on_category_id"
  end

  create_table "apps", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "total_votes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "connections", force: :cascade do |t|
    t.integer "asker_id"
    t.integer "receiver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "confirmed", default: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.integer "vote"
    t.bigint "user_id", null: false
    t.bigint "app_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_votes_on_app_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "app_categories", "apps"
  add_foreign_key "app_categories", "categories"
  add_foreign_key "connections", "users", column: "asker_id"
  add_foreign_key "connections", "users", column: "receiver_id"
  add_foreign_key "votes", "apps"
  add_foreign_key "votes", "users"
end
