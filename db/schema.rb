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

ActiveRecord::Schema.define(version: 20171027161235) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.string   "image"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "categories", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.string   "food_category"
    t.string   "restaurant_type"
    t.string   "environment"
    t.string   "special_deal"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["restaurant_id"], name: "index_categories_on_restaurant_id", using: :btree
  end

  create_table "coupons", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "value"
    t.string   "coupon_detail"
    t.boolean  "two_week_coupon"
    t.boolean  "month_coupon"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "number"
    t.boolean  "monday"
    t.boolean  "tuesday"
    t.boolean  "wednesday"
    t.boolean  "thursday"
    t.boolean  "friday"
    t.boolean  "saturday"
    t.boolean  "sunday"
    t.index ["restaurant_id"], name: "index_coupons_on_restaurant_id", using: :btree
  end

  create_table "cuisine_memberships", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.integer  "cuisine_id"
    t.integer  "position"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "cuisines", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["restaurant_id"], name: "index_favorites_on_restaurant_id", using: :btree
    t.index ["user_id"], name: "index_favorites_on_user_id", using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "operationtimes", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.string   "day"
    t.datetime "open_time"
    t.datetime "close_time"
    t.boolean  "is_closed"
    t.boolean  "is_holiday"
    t.string   "special_message"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["restaurant_id"], name: "index_operationtimes_on_restaurant_id", using: :btree
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "phone_number"
    t.string   "address"
    t.string   "zipcode"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.datetime "time"
    t.datetime "date"
    t.integer  "head_count"
    t.string   "special_request"
    t.boolean  "cancel"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["restaurant_id"], name: "index_reservations_on_restaurant_id", using: :btree
    t.index ["user_id"], name: "index_reservations_on_user_id", using: :btree
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "description"
    t.string   "zipcode"
    t.decimal  "latitude",            precision: 10, scale: 6
    t.decimal  "longitude",           precision: 10, scale: 6
    t.integer  "max_people"
    t.datetime "open_time"
    t.datetime "close_time"
    t.string   "phone_number"
    t.string   "website_link"
    t.integer  "max_table"
    t.string   "cost_range_min"
    t.string   "cost_range_max"
    t.string   "location"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "slug"
    t.json     "images"
    t.integer  "user_id"
    t.string   "blurb"
    t.datetime "breakfast_start"
    t.datetime "breakfast_end"
    t.datetime "lunch_start"
    t.datetime "lunch_end"
    t.datetime "dinner_start"
    t.datetime "dinner_end"
    t.boolean  "parking_valet"
    t.boolean  "outdoor_seating"
    t.boolean  "pet_friendly"
    t.boolean  "handicap_accessible"
    t.boolean  "smoking_allowed"
    t.boolean  "cocktails"
    t.boolean  "private_parties"
    t.boolean  "big_groups"
    t.index ["user_id"], name: "index_restaurants_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "role"
    t.string   "phone"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
