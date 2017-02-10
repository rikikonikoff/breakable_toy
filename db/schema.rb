ActiveRecord::Schema.define(version: 20170208162035) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.integer  "provider_id"
    t.boolean  "booked?",     default: false, null: false
    t.date     "date"
    t.time     "start_time"
    t.time     "end_time"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "user_id"
    t.index ["provider_id"], name: "index_appointments_on_provider_id", using: :btree
    t.index ["user_id"], name: "index_appointments_on_user_id", using: :btree
  end

  create_table "insurance_providers", force: :cascade do |t|
    t.integer "insurer_id"
    t.integer "provider_id"
    t.integer "user_id"
    t.index ["insurer_id"], name: "index_insurance_providers_on_insurer_id", using: :btree
    t.index ["provider_id"], name: "index_insurance_providers_on_provider_id", using: :btree
    t.index ["user_id"], name: "index_insurance_providers_on_user_id", using: :btree
  end

  create_table "insurers", force: :cascade do |t|
    t.string "company"
    t.string "plan"
  end

  create_table "providers", force: :cascade do |t|
    t.string "name",                                   null: false
    t.string "work_address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.text   "bio"
    t.string "profile"
    t.string "provider",     default: "google_oauth2"
    t.string "uid"
    t.string "email",                                  null: false
    t.string "avatar"
  end

  create_table "users", force: :cascade do |t|
    t.string "name",                               null: false
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "provider", default: "google_oauth2"
    t.string "uid"
    t.string "email"
  end

end
