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

<<<<<<< 2de87a0936e732f6f383545122ba84ada2a8c2dd
ActiveRecord::Schema.define(version: 20171013161249) do
=======
<<<<<<< 9f26750b7e5f2766e6e7f5daca204469b2cf19ec
ActiveRecord::Schema.define(version: 20171010001902) do
=======
ActiveRecord::Schema.define(version: 20171008204739) do
>>>>>>> Add resources base model and scaffold and associate with benefactors.
>>>>>>> Add resources base model and scaffold and associate with benefactors.

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "veteran_id"
    t.integer "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_friendships_on_friend_id"
    t.index ["veteran_id"], name: "index_friendships_on_veteran_id"
  end

  create_table "partnering_organizations", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.string "website"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.integer "role"
    t.integer "demographic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resources", force: :cascade do |t|
<<<<<<< 9f26750b7e5f2766e6e7f5daca204469b2cf19ec
    t.string "file_name"
    t.string "file"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
=======
    t.string "name"
    t.string "description"
    t.string "file"
    t.string "category"
    t.string "benefactor_type"
    t.bigint "benefactor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["benefactor_type", "benefactor_id"], name: "index_resources_on_benefactor_type_and_benefactor_id"
>>>>>>> Add resources base model and scaffold and associate with benefactors.
  end

  create_table "veterans", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.boolean "on_connect", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "roles", default: "0"
  end

end
