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

ActiveRecord::Schema.define(version: 2022_12_05_092456) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bloom_taxonomy_levels", force: :cascade do |t|
    t.string "level", null: false
  end

  create_table "bloom_taxonomy_verbs", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "bloom_taxonomy_level_id"
    t.index ["bloom_taxonomy_level_id"], name: "index_bloom_taxonomy_verbs_on_bloom_taxonomy_level_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.string "price"
    t.string "about"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "name", null: false
    t.string "code", null: false
    t.integer "credit_hours", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "location"
    t.time "start_time"
    t.time "end_time"
    t.text "days", default: [], array: true
  end

  create_table "learning_objectives", force: :cascade do |t|
    t.text "description", null: false
    t.integer "course_id", null: false
    t.integer "bloom_taxonomy_level_id", null: false
    t.integer "bloom_taxonomy_verb_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "key"
    t.integer "category", default: 0
    t.string "chosen_verb"
  end

  create_table "learning_objectives_topics", force: :cascade do |t|
    t.integer "learning_objective_id", null: false
    t.integer "topic_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "topics", force: :cascade do |t|
    t.text "description", null: false
    t.integer "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "map_topics", default: [], array: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.text "address", null: false
    t.text "phone_no", null: false
    t.string "password", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.time "office_hours_up"
    t.time "office_hours_to"
    t.string "total_time"
    t.text "days", default: [], array: true
  end

end
