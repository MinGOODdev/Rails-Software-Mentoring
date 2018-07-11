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

ActiveRecord::Schema.define(version: 20180709092354) do

  create_table "departments", force: :cascade do |t|
    t.string   "department_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "mentor_applies", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "team_name",                null: false
    t.string   "subject",                  null: false
    t.string   "purpose",                  null: false
    t.string   "content",                  null: false
    t.string   "method",                   null: false
    t.integer  "semester_id"
    t.string   "attachment",  default: ""
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "mentor_rooms", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "team_name",                       null: false
    t.string   "subject",                         null: false
    t.string   "purpose",                         null: false
    t.string   "content",                         null: false
    t.string   "method",                          null: false
    t.integer  "semester_id"
    t.string   "attachment",      default: ""
    t.boolean  "mid_report_ok",   default: false
    t.boolean  "final_report_ok", default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "notices", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "content"
    t.string   "attachment", default: ""
    t.integer  "hit",        default: 0,  null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "content"
    t.integer  "hit",        default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "room_members", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "mentor_room_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "semesters", force: :cascade do |t|
    t.string   "semester_name"
    t.boolean  "semester_able", default: true, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",  null: false
    t.string   "encrypted_password",     default: "",  null: false
    t.string   "student_name",                         null: false
    t.string   "grade",                                null: false
    t.string   "phone_number",                         null: false
    t.string   "mail",                                 null: false
    t.integer  "department_id",          default: 1,   null: false
    t.string   "bank_name",                            null: false
    t.string   "bank_account",                         null: false
    t.string   "authorization",          default: "2", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
