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

<<<<<<< 9f26750b7e5f2766e6e7f5daca204469b2cf19ec
ActiveRecord::Schema.define(version: 20171010001902) do
=======
ActiveRecord::Schema.define(version: 20171008204739) do
>>>>>>> Add resources base model and scaffold and associate with benefactors.

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

end
