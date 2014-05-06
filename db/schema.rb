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

ActiveRecord::Schema.define(:version => 20140506053621) do

  create_table "addresses", :force => true do |t|
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "address_line3"
    t.string   "city"
    t.string   "district"
    t.string   "state"
    t.integer  "pin_code"
    t.string   "country"
    t.integer  "patient_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "admissions", :force => true do |t|
    t.integer  "visit_id"
    t.datetime "admission_date"
    t.string   "bed"
    t.string   "doctor"
    t.boolean  "is_mlc"
    t.text     "mlc_details"
    t.text     "description"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "admissions", ["visit_id"], :name => "index_admissions_on_visit_id"

  create_table "admit_days", :force => true do |t|
    t.integer  "admission_id"
    t.datetime "admit_date"
    t.text     "doctor_notes"
    t.text     "nurse_notes"
    t.text     "care_giver_notes"
    t.text     "treatment"
    t.integer  "serial_number"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "admit_days", ["admission_id"], :name => "index_admit_days_on_admission_id"

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

  create_table "descriptive_questions", :force => true do |t|
    t.string   "title"
    t.string   "sub_category"
    t.string   "category"
    t.string   "super_category"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "follow_ups", :force => true do |t|
    t.datetime "follow_up_date"
    t.text     "final_diagnosis"
    t.text     "comments"
    t.integer  "visit_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
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

  create_table "investigations", :force => true do |t|
    t.string   "title"
    t.string   "units"
    t.string   "normal_min"
    t.string   "normal_max"
    t.string   "sub_category"
    t.string   "category"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "patients", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "mobile"
    t.string   "husband_name"
    t.string   "father_name"
    t.integer  "age"
    t.string   "gender"
    t.datetime "date_of_registration"
    t.string   "middle_name"
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
    t.string   "religion"
    t.string   "email"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "uhid"
  end

  create_table "prescriptions", :force => true do |t|
    t.integer  "visit_id"
    t.string   "medicine"
    t.string   "frequency"
    t.string   "duration"
    t.string   "route"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "prescriptions", ["visit_id"], :name => "index_prescriptions_on_visit_id"

  create_table "questions", :force => true do |t|
    t.string   "title"
    t.string   "sub_category"
    t.string   "category"
    t.string   "super_category"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

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
    t.string   "role"
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
    t.integer  "age"
    t.string   "gender"
    t.date     "date_of_birth"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "address_line3"
    t.string   "city"
    t.string   "district"
    t.string   "state"
    t.integer  "pin_code"
    t.string   "country"
    t.string   "phone_number"
    t.string   "mobile"
    t.string   "graduation"
    t.string   "post_graduation"
    t.text     "about_me"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "visit_descriptions", :force => true do |t|
    t.integer "visit_id"
    t.integer "description_id"
  end

  create_table "visit_descriptive_questions", :force => true do |t|
    t.integer  "visit_id"
    t.integer  "descriptive_question_id"
    t.text     "answer"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "visit_investigations", :force => true do |t|
    t.integer  "visit_id"
    t.integer  "investigation_id"
    t.string   "report"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "visit_questions", :force => true do |t|
    t.integer  "visit_id"
    t.integer  "question_id"
    t.integer  "answer_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "visits", :force => true do |t|
    t.integer  "patient_id"
    t.text     "description"
    t.text     "chief_complaint"
    t.text     "pms_history"
    t.text     "fms_history"
    t.text     "ps_history"
    t.text     "treatment_history"
    t.text     "other_systems"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.text     "gpe"
    t.text     "vitals"
    t.text     "general_examination"
  end

end
