# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_26_155336) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.date "date"
    t.time "begin_at"
    t.time "end_at"
    t.string "comments"
    t.bigint "user_id"
    t.string "actable_type"
    t.bigint "actable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["actable_type", "actable_id"], name: "index_events_on_actable_type_and_actable_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "food_events", force: :cascade do |t|
    t.integer "recipe_id"
  end

  create_table "shopping_events", force: :cascade do |t|
    t.string "date_range"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password"
  end

end
