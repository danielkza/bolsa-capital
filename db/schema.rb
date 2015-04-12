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

ActiveRecord::Schema.define(version: 20150412115011) do

  create_table "bad_cards", force: :cascade do |t|
    t.integer  "merchant_id"
    t.string   "card"
    t.string   "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "bad_cards", ["merchant_id"], name: "index_bad_cards_on_merchant_id"

  create_table "investor_offers", force: :cascade do |t|
    t.integer  "investor_id"
    t.integer  "merchant_offer_id"
    t.decimal  "fee"
    t.datetime "accepted_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "investor_offers", ["investor_id"], name: "index_investor_offers_on_investor_id"
  add_index "investor_offers", ["merchant_offer_id"], name: "index_investor_offers_on_merchant_offer_id"

  create_table "investors", force: :cascade do |t|
    t.string   "name"
    t.text     "code"
    t.integer  "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "merchant_offers", force: :cascade do |t|
    t.integer  "merchant_id"
    t.decimal  "amount"
    t.datetime "starts"
    t.datetime "ends"
    t.datetime "accepted_at"
    t.datetime "repaid_at"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "merchant_offers", ["merchant_id"], name: "index_merchant_offers_on_merchant_id"

  create_table "merchants", force: :cascade do |t|
    t.string   "name"
    t.text     "code"
    t.integer  "owner_id"
    t.text     "address"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.decimal  "revenue"
    t.string   "access_token"
  end

  create_table "payment_histories", force: :cascade do |t|
    t.integer  "merchant_id"
    t.integer  "month"
    t.integer  "year"
    t.decimal  "total_received"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "currency"
  end

  add_index "payment_histories", ["currency", "month", "year"], name: "index_payment_histories_on_currency_and_month_and_year", unique: true
  add_index "payment_histories", ["merchant_id"], name: "index_payment_histories_on_merchant_id"

  create_table "processed_payments", id: false, force: :cascade do |t|
    t.string "payment_id", null: false
  end

  add_index "processed_payments", ["payment_id"], name: "index_processed_payments_on_payment_id", unique: true

  create_table "users", force: :cascade do |t|
    t.text     "password_digest"
    t.text     "name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.string   "merchant_identifier"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
