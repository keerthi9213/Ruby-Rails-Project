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

ActiveRecord::Schema[7.0].define(version: 2023_12_09_215912) do
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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "answers", force: :cascade do |t|
    t.text "content"
    t.bigint "question_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "birdhouses", force: :cascade do |t|
    t.string "material"
    t.string "color"
    t.string "style"
    t.string "roof_design"
    t.string "size"
    t.string "artistic_details"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "likes", default: 10
    t.integer "quantity", default: 5
  end

  create_table "cart_items", force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.bigint "birdhouse_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["birdhouse_id"], name: "index_cart_items_on_birdhouse_id"
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.decimal "shipping_fee", default: "5.99"
    t.decimal "taxes", default: "3.99"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "line_items", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "birdhouse_id", null: false
    t.integer "quantity", default: 1
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["birdhouse_id"], name: "index_line_items_on_birdhouse_id"
    t.index ["order_id"], name: "index_line_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "items"
    t.decimal "total_cost"
    t.string "shipping_address"
    t.string "payment_details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.text "birdhouse_ids"
    t.string "cardholder_name"
    t.string "card_type"
    t.bigint "card_number"
    t.string "card_expiry"
    t.integer "card_cvv"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.string "city"
    t.string "temperature"
    t.integer "number_of_birds"
    t.integer "number_of_species"
    t.text "species"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_quizzes_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "feedback"
    t.bigint "order_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_reviews_on_order_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.string "first_name"
    t.string "last_name"
    t.string "contact_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "cart_items", "birdhouses"
  add_foreign_key "cart_items", "carts"
  add_foreign_key "carts", "users"
  add_foreign_key "line_items", "birdhouses"
  add_foreign_key "line_items", "orders"
  add_foreign_key "orders", "users"
  add_foreign_key "questions", "users"
  add_foreign_key "quizzes", "users"
  add_foreign_key "reviews", "orders"
  add_foreign_key "reviews", "users"
end
