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

ActiveRecord::Schema.define(version: 20170522212622) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "provider",   null: false
    t.string   "uid",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider", "uid"], name: "index_authentications_on_provider_and_uid", using: :btree
  end

  create_table "cards", force: :cascade do |t|
    t.text     "original_text"
    t.text     "translated_text"
    t.date     "review_date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
    t.string   "avatar"
    t.integer  "deck_id"
    t.index ["deck_id"], name: "index_cards_on_deck_id", using: :btree
    t.index ["user_id"], name: "index_cards_on_user_id", using: :btree
  end

  create_table "decks", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "card_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                        null: false
    t.string   "password"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "salt"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "crypted_password"
    t.integer  "current_deck_id"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
  end

end