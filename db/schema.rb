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

ActiveRecord::Schema.define(version: 20150407163322) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "codes", force: :cascade do |t|
    t.string   "title",      default: "", null: false
    t.text     "message",    default: "", null: false
    t.string   "status",     default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "submissions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "code_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "graphic_file_name"
    t.string   "graphic_content_type"
    t.integer  "graphic_file_size"
    t.datetime "graphic_updated_at"
    t.integer  "votes",                default: 0,  null: false
    t.string   "status",               default: "", null: false
    t.string   "artist",               default: "", null: false
    t.string   "facebook",             default: "", null: false
    t.string   "twitter",              default: "", null: false
    t.string   "pinterest",            default: "", null: false
    t.string   "website",              default: "", null: false
    t.string   "instagram",            default: "", null: false
    t.string   "dribbble",             default: "", null: false
    t.string   "behance",              default: "", null: false
  end

  add_index "submissions", ["code_id"], name: "index_submissions_on_code_id", using: :btree
  add_index "submissions", ["user_id"], name: "index_submissions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",                   default: "",    null: false
    t.string   "role",                   default: "",    null: false
    t.string   "status",                 default: "",    null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "provider",               default: "",    null: false
    t.string   "uid",                    default: "",    null: false
    t.boolean  "valid_email",            default: false
    t.string   "handle",                 default: ""
    t.integer  "recent_vote",            default: 0,     null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "submissions", "codes"
  add_foreign_key "submissions", "users"
end
