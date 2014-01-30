# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140130153616) do

  create_table "admin_profiles", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brand_pictures", force: true do |t|
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "brand_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brand_translations", force: true do |t|
    t.integer  "brand_id",          null: false
    t.string   "locale",            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "short_description"
    t.text     "full_description"
    t.text     "title"
  end

  add_index "brand_translations", ["brand_id"], name: "index_brand_translations_on_brand_id", using: :btree
  add_index "brand_translations", ["locale"], name: "index_brand_translations_on_locale", using: :btree

  create_table "brands", force: true do |t|
    t.string   "identificator", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brands_categories", id: false, force: true do |t|
    t.integer "brand_id"
    t.integer "category_id"
  end

  add_index "brands_categories", ["brand_id"], name: "index_brands_categories_on_brand_id", using: :btree
  add_index "brands_categories", ["category_id"], name: "index_brands_categories_on_category_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "identificator", null: false
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_pages", id: false, force: true do |t|
    t.integer "page_id"
    t.integer "category_id"
  end

  add_index "categories_pages", ["category_id"], name: "index_categories_pages_on_category_id", using: :btree
  add_index "categories_pages", ["page_id"], name: "index_categories_pages_on_page_id", using: :btree

  create_table "categories_products", id: false, force: true do |t|
    t.integer "product_id"
    t.integer "category_id"
  end

  add_index "categories_products", ["category_id"], name: "index_categories_products_on_category_id", using: :btree
  add_index "categories_products", ["product_id"], name: "index_categories_products_on_product_id", using: :btree

  create_table "category_pictures", force: true do |t|
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "category_translations", force: true do |t|
    t.integer  "category_id", null: false
    t.string   "locale",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "title"
  end

  add_index "category_translations", ["category_id"], name: "index_category_translations_on_category_id", using: :btree
  add_index "category_translations", ["locale"], name: "index_category_translations_on_locale", using: :btree

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "dealer_profile_translations", force: true do |t|
    t.integer  "dealer_profile_id", null: false
    t.string   "locale",            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "contacts"
    t.text     "person_contacts"
  end

  add_index "dealer_profile_translations", ["dealer_profile_id"], name: "index_dealer_profile_translations_on_dealer_profile_id", using: :btree
  add_index "dealer_profile_translations", ["locale"], name: "index_dealer_profile_translations_on_locale", using: :btree

  create_table "dealer_profiles", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "city_latitude"
    t.float    "city_longitude"
    t.string   "identificator",  null: false
    t.string   "status",         null: false
    t.string   "city",           null: false
    t.string   "phone_number",   null: false
    t.string   "email",          null: false
  end

  create_table "page_translations", force: true do |t|
    t.integer  "page_id",       null: false
    t.string   "locale",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "short_content"
    t.text     "full_content"
    t.text     "title"
  end

  add_index "page_translations", ["locale"], name: "index_page_translations_on_locale", using: :btree
  add_index "page_translations", ["page_id"], name: "index_page_translations_on_page_id", using: :btree

  create_table "pages", force: true do |t|
    t.string   "identificator", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_pictures", force: true do |t|
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_translations", force: true do |t|
    t.integer  "product_id",        null: false
    t.string   "locale",            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "short_description"
    t.text     "full_description"
  end

  add_index "product_translations", ["locale"], name: "index_product_translations_on_locale", using: :btree
  add_index "product_translations", ["product_id"], name: "index_product_translations_on_product_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "brand_id",      null: false
    t.string   "identificator", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",                   default: "", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
