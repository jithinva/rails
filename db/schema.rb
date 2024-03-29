# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121003063147) do

  create_table "categories", :force => true do |t|
    t.string   "categories"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "commodities", :force => true do |t|
    t.string   "commodity"
    t.text     "description"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "intakes", :force => true do |t|
    t.float    "intake_amt"
    t.integer  "user_id"
    t.integer  "commodity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "outflows", :force => true do |t|
    t.float    "outflow_amt"
    t.integer  "user_id"
    t.integer  "commodity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
