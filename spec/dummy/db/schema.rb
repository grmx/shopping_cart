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

ActiveRecord::Schema.define(version: 20151108141948) do

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.decimal  "price",      precision: 5, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "pens", force: :cascade do |t|
    t.string   "title"
    t.decimal  "price",      precision: 5, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "shopping_cart_addresses", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "zipcode",    limit: 5
    t.string   "city"
    t.string   "country"
    t.string   "phone",      limit: 12
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "shopping_cart_credit_cards", force: :cascade do |t|
    t.string   "number",        limit: 16
    t.string   "exp_month",     limit: 2
    t.string   "exp_year",      limit: 4
    t.string   "cvv",           limit: 3
    t.integer  "customer_id"
    t.string   "customer_type"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "shopping_cart_deliveries", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price",      precision: 5, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "shopping_cart_order_items", force: :cascade do |t|
    t.decimal  "price",        precision: 5, scale: 2
    t.integer  "quantity"
    t.integer  "product_id"
    t.string   "product_type"
    t.integer  "order_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "shopping_cart_order_items", ["order_id"], name: "index_shopping_cart_order_items_on_order_id"

  create_table "shopping_cart_orders", force: :cascade do |t|
    t.decimal  "total_price",         precision: 5, scale: 2
    t.string   "state",                                       default: "in_progress"
    t.datetime "completed_at"
    t.integer  "customer_id"
    t.string   "customer_type"
    t.integer  "billing_address_id"
    t.integer  "shipping_address_id"
    t.integer  "delivery_id"
    t.datetime "created_at",                                                          null: false
    t.datetime "updated_at",                                                          null: false
  end

  add_index "shopping_cart_orders", ["delivery_id"], name: "index_shopping_cart_orders_on_delivery_id"

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
