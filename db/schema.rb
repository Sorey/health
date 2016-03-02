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

ActiveRecord::Schema.define(version: 20160302092834) do

  create_table "medical_setup_categories", force: :cascade do |t|
    t.string   "name"
    t.string   "type_category"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "medical_setup_licenses", force: :cascade do |t|
    t.date     "date_start"
    t.date     "date_finish"
    t.string   "number_license"
    t.integer  "medical_setup_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "medical_setup_licenses", ["medical_setup_id"], name: "index_medical_setup_licenses_on_medical_setup_id"

  create_table "medical_setups", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "head_doctor"
    t.string   "email"
    t.string   "category_level"
    t.string   "site_address"
    t.integer  "medical_setup_category_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "medical_setups", ["medical_setup_category_id"], name: "index_medical_setups_on_medical_setup_category_id"

  create_table "menu_items", force: :cascade do |t|
    t.string   "title"
    t.string   "type_level"
    t.string   "type_item"
    t.integer  "parent_id"
    t.string   "link"
    t.boolean  "show"
    t.string   "description"
    t.integer  "order_item"
    t.string   "alias"
    t.string   "alias_type"
    t.integer  "id_post"
    t.string   "link_component"
    t.string   "link_description"
    t.string   "meta_title"
    t.string   "meta_description"
    t.string   "meta_keywords"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "menu_items", ["parent_id"], name: "index_menu_items_on_parent_id"

  create_table "news", force: :cascade do |t|
    t.string   "title"
    t.string   "pre_text"
    t.text     "description"
    t.datetime "publish_up"
    t.datetime "publish_down"
    t.boolean  "publish_on"
    t.string   "image"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "news", ["user_id"], name: "index_news_on_user_id"

  create_table "roles", force: :cascade do |t|
    t.string   "title"
    t.integer  "type_role"
    t.integer  "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "roles", ["parent_id"], name: "index_roles_on_parent_id"

  create_table "user_roles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_roles", ["role_id"], name: "index_user_roles_on_role_id"
  add_index "user_roles", ["user_id"], name: "index_user_roles_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
