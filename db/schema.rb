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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130401202006) do

  create_table "clients", :force => true do |t|
    t.string   "email"
    t.string   "phone"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "zipcode"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.decimal  "amount_paid"
    t.datetime "date_paid"
    t.string   "stripe_id"
    t.integer  "tickets_purchased"
    t.integer  "trip_id"
  end

  create_table "confirmations", :force => true do |t|
    t.string   "confirmation_number"
    t.integer  "client_id"
    t.boolean  "is_used"
    t.boolean  "is_expired"
    t.date     "expiration_date"
    t.string   "source"
    t.string   "created_by"
    t.decimal  "value"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.boolean  "is_cancelled"
    t.date     "redeemed_on"
    t.integer  "trip_id"
  end

  create_table "contacts", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.text     "message"
    t.string   "email"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.boolean  "responded",     :default => false
    t.date     "response_date"
    t.string   "responded_by"
    t.text     "notes"
  end

  create_table "dates", :force => true do |t|
    t.string   "title"
    t.datetime "date"
    t.decimal  "price"
    t.integer  "spots_available"
    t.integer  "tickets_sold"
    t.integer  "event_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "directions"
    t.integer  "location_id"
  end

  create_table "events_photos", :id => false, :force => true do |t|
    t.integer "event_id"
    t.integer "photo_id"
  end

  create_table "faqs", :force => true do |t|
    t.text     "question"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "answer"
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "description"
  end

  create_table "photos", :force => true do |t|
    t.integer  "location_id"
    t.boolean  "is_primary"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "photo"
    t.string   "title"
    t.boolean  "in_gallery"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "reviews", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "hometown"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "featured"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "trips", :force => true do |t|
    t.string   "title"
    t.datetime "date"
    t.decimal  "price"
    t.integer  "spots_available"
    t.integer  "tickets_sold"
    t.integer  "event_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "name"
    t.boolean  "admin",                        :default => true
  end

  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"

  create_table "versions", :force => true do |t|
    t.string   "item_type",  :null => false
    t.integer  "item_id",    :null => false
    t.string   "event",      :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"

end
