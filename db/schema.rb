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

ActiveRecord::Schema.define(:version => 20140401182829) do

  create_table "addresses", :force => true do |t|
    t.string   "building"
    t.string   "street"
    t.string   "nearest_milestone"
    t.string   "city"
    t.string   "district"
    t.string   "state"
    t.integer  "pin_code"
    t.string   "country"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "answers", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "title"
    t.string   "master_category"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "descriptions", :force => true do |t|
    t.text     "title"
    t.integer  "category_id"
    t.integer  "visit_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "hospital_department_users", :force => true do |t|
    t.integer "hospital_department_id"
    t.integer "user_id"
  end

  create_table "hospital_departments", :force => true do |t|
    t.integer "hospital_id"
    t.integer "department_id"
  end

  create_table "hospitals", :force => true do |t|
    t.string   "name"
    t.integer  "university_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "patients", :force => true do |t|
    t.string   "first_name"
    t.string   "mobile"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "husband_name"
    t.string   "father_name"
    t.integer  "age"
    t.string   "gender"
    t.string   "aadhaar_card_number"
    t.datetime "date_of_registration"
    t.string   "email"
    t.string   "middle_name"
    t.string   "last_name"
    t.datetime "date_of_birth"
    t.string   "reference_mobile"
    t.string   "reference_name"
    t.string   "emergency_mobile"
    t.string   "emergency_name"
    t.string   "nationality"
    t.string   "occupation"
    t.string   "patient_type"
    t.string   "id_type"
    t.string   "id_number"
    t.string   "referred_by"
    t.string   "insurance_provider"
    t.string   "insurance_policy_number"
    t.integer  "address_id"
    t.string   "religion"
  end

  create_table "questions", :force => true do |t|
    t.string   "title"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "trigrams", :force => true do |t|
    t.string  "trigram",     :limit => 3
    t.integer "score",       :limit => 2
    t.integer "owner_id"
    t.string  "owner_type"
    t.string  "fuzzy_field"
  end

  add_index "trigrams", ["owner_id", "owner_type", "fuzzy_field", "trigram", "score"], :name => "index_for_match"
  add_index "trigrams", ["owner_id", "owner_type"], :name => "index_by_owner"

  create_table "user_patients", :force => true do |t|
    t.integer "user_id"
    t.integer "patient_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "logo"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "role"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "visit_questions", :force => true do |t|
    t.integer  "visit_id"
    t.integer  "question_id"
    t.integer  "answer_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "visits", :force => true do |t|
    t.integer  "patient_id"
    t.integer  "history_id"
    t.integer  "examination_id"
    t.integer  "investigation_id"
    t.integer  "admission_id"
    t.integer  "treatment_id"
    t.integer  "follow_up_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end
