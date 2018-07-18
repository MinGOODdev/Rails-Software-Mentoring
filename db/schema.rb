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

ActiveRecord::Schema.define(version: 20180714113727) do

  create_table "admin_options", force: :cascade do |t|
    t.integer  "mentor_apply_active", default: 0
    t.integer  "mentee_apply_active", default: 0
    t.integer  "room_member_max_num", default: 6
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string   "department_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "final_reports", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "semester_id"
    t.integer  "mentor_room_id"
    t.string   "attachment",     null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "fridays", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "am_nine_to_ten",      default: 0
    t.integer  "am_ten_to_eleven",    default: 0
    t.integer  "am_eleven_to_twelve", default: 0
    t.integer  "pm_twelve_to_one",    default: 0
    t.integer  "pm_one_to_two",       default: 0
    t.integer  "pm_two_to_three",     default: 0
    t.integer  "pm_three_to_four",    default: 0
    t.integer  "pm_four_to_five",     default: 0
    t.integer  "pm_five_to_six",      default: 0
    t.integer  "pm_six_to_seven",     default: 0
    t.integer  "pm_seven_to_eight",   default: 0
    t.integer  "pm_eight_to_nine"
    t.integer  "pm_nine_to_ten",      default: 0
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "mentor_applies", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "semester_id"
    t.string   "team_name",                null: false
    t.string   "subject",                  null: false
    t.string   "purpose",                  null: false
    t.string   "content",                  null: false
    t.string   "method",                   null: false
    t.string   "attachment",  default: ""
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "mentor_rooms", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "semester_id"
    t.string   "team_name",                       null: false
    t.string   "subject",                         null: false
    t.string   "purpose",                         null: false
    t.string   "content",                         null: false
    t.string   "method",                          null: false
    t.string   "attachment",      default: ""
    t.boolean  "mid_report_ok",   default: false
    t.boolean  "final_report_ok", default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "mid_reports", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "semester_id"
    t.integer  "mentor_room_id"
    t.string   "attachment",     null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "mondays", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "am_nine_to_ten",      default: 0
    t.integer  "am_ten_to_eleven",    default: 0
    t.integer  "am_eleven_to_twelve", default: 0
    t.integer  "pm_twelve_to_one",    default: 0
    t.integer  "pm_one_to_two",       default: 0
    t.integer  "pm_two_to_three",     default: 0
    t.integer  "pm_three_to_four",    default: 0
    t.integer  "pm_four_to_five",     default: 0
    t.integer  "pm_five_to_six",      default: 0
    t.integer  "pm_six_to_seven",     default: 0
    t.integer  "pm_seven_to_eight",   default: 0
    t.integer  "pm_eight_to_nine"
    t.integer  "pm_nine_to_ten",      default: 0
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "notices", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title",                   null: false
    t.string   "content",    default: "", null: false
    t.string   "attachment", default: ""
    t.integer  "hit",        default: 0,  null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title",                   null: false
    t.string   "content",    default: "", null: false
    t.integer  "hit",        default: 0,  null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
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

  create_table "thursdays", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "am_nine_to_ten",      default: 0
    t.integer  "am_ten_to_eleven",    default: 0
    t.integer  "am_eleven_to_twelve", default: 0
    t.integer  "pm_twelve_to_one",    default: 0
    t.integer  "pm_one_to_two",       default: 0
    t.integer  "pm_two_to_three",     default: 0
    t.integer  "pm_three_to_four",    default: 0
    t.integer  "pm_four_to_five",     default: 0
    t.integer  "pm_five_to_six",      default: 0
    t.integer  "pm_six_to_seven",     default: 0
    t.integer  "pm_seven_to_eight",   default: 0
    t.integer  "pm_eight_to_nine"
    t.integer  "pm_nine_to_ten",      default: 0
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "tuesdays", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "am_nine_to_ten",      default: 0
    t.integer  "am_ten_to_eleven",    default: 0
    t.integer  "am_eleven_to_twelve", default: 0
    t.integer  "pm_twelve_to_one",    default: 0
    t.integer  "pm_one_to_two",       default: 0
    t.integer  "pm_two_to_three",     default: 0
    t.integer  "pm_three_to_four",    default: 0
    t.integer  "pm_four_to_five",     default: 0
    t.integer  "pm_five_to_six",      default: 0
    t.integer  "pm_six_to_seven",     default: 0
    t.integer  "pm_seven_to_eight",   default: 0
    t.integer  "pm_eight_to_nine"
    t.integer  "pm_nine_to_ten",      default: 0
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                                null: false
    t.string   "encrypted_password",                   null: false
    t.string   "student_name",                         null: false
    t.string   "grade",                                null: false
    t.string   "phone_number",                         null: false
    t.string   "mail",                                 null: false
    t.integer  "department_id",                        null: false
    t.string   "bank_name"
    t.string   "bank_account"
    t.string   "authorization",          default: "2"
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

  create_table "wednesdays", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "am_nine_to_ten",      default: 0
    t.integer  "am_ten_to_eleven",    default: 0
    t.integer  "am_eleven_to_twelve", default: 0
    t.integer  "pm_twelve_to_one",    default: 0
    t.integer  "pm_one_to_two",       default: 0
    t.integer  "pm_two_to_three",     default: 0
    t.integer  "pm_three_to_four",    default: 0
    t.integer  "pm_four_to_five",     default: 0
    t.integer  "pm_five_to_six",      default: 0
    t.integer  "pm_six_to_seven",     default: 0
    t.integer  "pm_seven_to_eight",   default: 0
    t.integer  "pm_eight_to_nine"
    t.integer  "pm_nine_to_ten",      default: 0
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

end
