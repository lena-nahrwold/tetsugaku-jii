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

ActiveRecord::Schema.define(version: 20200416161526) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "main_entries", force: :cascade do |t|
    t.string "japanese"
    t.string "english"
    t.string "phonetics"
    t.string "page"
    t.json   "jisho"
    t.string "jisho_link"
    t.json   "buddhdic"
    t.string "buddhdic_link"
    t.json   "cjk"
    t.string "cjk_link"
    t.json   "symbols"
    t.text   "comment"
    t.text   "dict_comment"
  end

  create_table "sub_entries", force: :cascade do |t|
    t.string "japanese"
    t.json   "jisho"
    t.string "jisho_link"
    t.json   "buddhdic"
    t.string "buddhdic_link"
    t.json   "cjk"
    t.string "cjk_link"
    t.string "combinations_amount"
    t.json   "combinations"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "name"
    t.integer  "role"
    t.boolean  "approved",               default: false, null: false
    t.index ["approved"], name: "index_users_on_approved", using: :btree
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
