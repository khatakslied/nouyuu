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

ActiveRecord::Schema.define(version: 2021_11_23_102311) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "crops", force: :cascade do |t|
    t.string "name"
    t.string "plant_family"
    t.text "description"
    t.string "image_url"
    t.integer "spacing_in_cm"
    t.integer "planting_depth_in_cm"
    t.boolean "climber"
    t.string "sun_exposure"
    t.string "nitrogen_needs"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "max_days_to_harvest"
    t.integer "min_days_to_harvest"
    t.string "sowing_months"
    t.integer "max_hardiness_zone"
    t.integer "min_hardiness_zone"
    t.integer "water_needs"
    t.string "crop_type"
  end

  create_table "gardens", force: :cascade do |t|
    t.string "location"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "height"
    t.float "width"
    t.index ["user_id"], name: "index_gardens_on_user_id"
  end

  create_table "plots", force: :cascade do |t|
    t.string "name"
    t.integer "days_since_watering"
    t.bigint "garden_id", null: false
    t.bigint "crop_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["crop_id"], name: "index_plots_on_crop_id"
    t.index ["garden_id"], name: "index_plots_on_garden_id"
  end

  create_table "tiles", force: :cascade do |t|
    t.boolean "shaded"
    t.integer "nitrogen_balance"
    t.integer "x_position"
    t.integer "y_position"
    t.bigint "garden_id", null: false
    t.bigint "plot_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["garden_id"], name: "index_tiles_on_garden_id"
    t.index ["plot_id"], name: "index_tiles_on_plot_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "display_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "gardens", "users"
  add_foreign_key "plots", "crops"
  add_foreign_key "plots", "gardens"
  add_foreign_key "tiles", "gardens"
  add_foreign_key "tiles", "plots"
end
