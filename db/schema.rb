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

ActiveRecord::Schema.define(version: 20180222161642) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "veteran_id"
    t.integer "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_friendships_on_friend_id"
    t.index ["veteran_id", "friend_id"], name: "index_friendships_on_veteran_id_and_friend_id", unique: true
    t.index ["veteran_id"], name: "index_friendships_on_veteran_id"
  end

  create_table "partnering_organizations", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.string "website"
    t.string "address"
    t.decimal "lat", precision: 10, scale: 6
    t.decimal "lng", precision: 10, scale: 6
    t.integer "role"
    t.integer "demographic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.boolean "approval_status", default: false
    t.string "image"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "description"
    t.index ["confirmation_token"], name: "index_partnering_organizations_on_confirmation_token", unique: true
    t.index ["email"], name: "index_partnering_organizations_on_email", unique: true
    t.index ["reset_password_token"], name: "index_partnering_organizations_on_reset_password_token", unique: true
  end

  create_table "resources", force: :cascade do |t|
    t.string "file_name"
    t.string "file"
    t.integer "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "owner_type"
    t.bigint "owner_id"
    t.string "description"
    t.integer "section"
    t.index ["owner_type", "owner_id"], name: "index_resources_on_owner_type_and_owner_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "veteran_id"
    t.bigint "partnering_organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["partnering_organization_id"], name: "index_subscriptions_on_partnering_organization_id"
    t.index ["veteran_id"], name: "index_subscriptions_on_veteran_id"
  end

  create_table "upvotes", force: :cascade do |t|
    t.bigint "veteran_id"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resource_id"], name: "index_upvotes_on_resource_id"
    t.index ["veteran_id"], name: "index_upvotes_on_veteran_id"
  end

  create_table "veterans", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.boolean "on_connect", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "roles", default: "[]"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.integer "military_branch"
    t.string "unit"
    t.string "notes"
    t.boolean "accept_messages"
    t.boolean "share_profile"
    t.boolean "accept_notices"
    t.decimal "lat", precision: 10, scale: 6
    t.decimal "lng", precision: 10, scale: 6
    t.string "address"
    t.string "phone_number"
    t.index ["email"], name: "index_veterans_on_email", unique: true
    t.index ["reset_password_token"], name: "index_veterans_on_reset_password_token", unique: true
  end

  add_foreign_key "subscriptions", "partnering_organizations", on_delete: :cascade
  add_foreign_key "subscriptions", "veterans"
  add_foreign_key "upvotes", "resources"
  add_foreign_key "upvotes", "veterans"
end
