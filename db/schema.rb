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

ActiveRecord::Schema[7.0].define(version: 2023_10_29_233856) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "place_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_favorites_on_place_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.string "image"
    t.integer "user_id"
    t.string "toilet"
    t.string "vendingmachine"
  end

  create_table "places_schoolgrades", force: :cascade do |t|
    t.bigint "place_id", null: false
    t.bigint "schoolgrade_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_places_schoolgrades_on_place_id"
    t.index ["schoolgrade_id"], name: "index_places_schoolgrades_on_schoolgrade_id"
  end

  create_table "schoolgrades", force: :cascade do |t|
    t.string "grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "targets", force: :cascade do |t|
    t.bigint "place_id", null: false
    t.bigint "schoolgrade_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_targets_on_place_id"
    t.index ["schoolgrade_id"], name: "index_targets_on_schoolgrade_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "image"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "favorites", "places"
  add_foreign_key "favorites", "users"
  add_foreign_key "places_schoolgrades", "places"
  add_foreign_key "places_schoolgrades", "schoolgrades"
  add_foreign_key "targets", "places"
  add_foreign_key "targets", "schoolgrades"
end
