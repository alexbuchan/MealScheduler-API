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

ActiveRecord::Schema.define(version: 2020_12_22_184522) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "date_frequencies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "events", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "eventable_id"
    t.string "eventable_type"
    t.string "title"
    t.date "date"
    t.time "begin_at"
    t.time "end_at"
    t.string "comments"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["eventable_id"], name: "index_events_on_eventable_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "food_events", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "food_events_recipes", force: :cascade do |t|
    t.bigint "recipe_id"
    t.bigint "food_event_id"
    t.index ["food_event_id"], name: "index_food_events_recipes_on_food_event_id"
    t.index ["recipe_id"], name: "index_food_events_recipes_on_recipe_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.bigint "measure_unit_type_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["measure_unit_type_id"], name: "index_ingredients_on_measure_unit_type_id"
  end

  create_table "measure_systems", force: :cascade do |t|
    t.string "name"
  end

  create_table "measure_systems_units", force: :cascade do |t|
    t.bigint "measure_system_id"
    t.bigint "measure_unit_id"
    t.index ["measure_system_id"], name: "index_measure_systems_units_on_measure_system_id"
    t.index ["measure_unit_id"], name: "index_measure_systems_units_on_measure_unit_id"
  end

  create_table "measure_unit_types", force: :cascade do |t|
    t.string "unit_type"
  end

  create_table "measure_units", force: :cascade do |t|
    t.string "name"
    t.bigint "measure_unit_type_id"
    t.index ["measure_unit_type_id"], name: "index_measure_units_on_measure_unit_type_id"
  end

  create_table "recipe_ingredients", force: :cascade do |t|
    t.integer "amount"
    t.bigint "recipe_id"
    t.bigint "ingredient_id"
    t.bigint "measure_unit_id"
    t.index ["ingredient_id"], name: "index_recipe_ingredients_on_ingredient_id"
    t.index ["measure_unit_id"], name: "index_recipe_ingredients_on_measure_unit_id"
    t.index ["recipe_id"], name: "index_recipe_ingredients_on_recipe_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.string "steps"
    t.string "comments"
    t.integer "preparation_time"
    t.integer "cooking_time"
    t.string "difficulty"
    t.bigint "measure_system_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["measure_system_id"], name: "index_recipes_on_measure_system_id"
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "shopping_events", force: :cascade do |t|
    t.bigint "date_frequency_id"
    t.index ["date_frequency_id"], name: "index_shopping_events_on_date_frequency_id"
  end

  create_table "shopping_events_recipes", force: :cascade do |t|
    t.bigint "recipe_id"
    t.bigint "shopping_event_id"
    t.index ["recipe_id"], name: "index_shopping_events_recipes_on_recipe_id"
    t.index ["shopping_event_id"], name: "index_shopping_events_recipes_on_shopping_event_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at"
  end

end
