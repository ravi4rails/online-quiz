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

ActiveRecord::Schema.define(version: 2018_10_05_090015) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
    t.index ["username"], name: "index_admins_on_username", unique: true
  end

  create_table "mcq_options", force: :cascade do |t|
    t.string "option"
    t.bigint "multiple_choice_question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["multiple_choice_question_id"], name: "index_mcq_options_on_multiple_choice_question_id"
  end

  create_table "multiple_choice_questions", force: :cascade do |t|
    t.text "question"
    t.bigint "test_paper_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sequence_number"
    t.string "status"
    t.string "correct_answer"
    t.index ["test_paper_id"], name: "index_multiple_choice_questions_on_test_paper_id"
  end

  create_table "question_user_statuses", force: :cascade do |t|
    t.integer "user_id"
    t.integer "multiple_choice_question_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "submissions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "test_paper_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["test_paper_id"], name: "index_submissions_on_test_paper_id"
    t.index ["user_id"], name: "index_submissions_on_user_id"
  end

  create_table "test_papers", force: :cascade do |t|
    t.string "name"
    t.date "date_to_take_test"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_response_values", force: :cascade do |t|
    t.bigint "submission_id"
    t.bigint "multiple_choice_question_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "form_values", default: "{}", null: false
    t.index ["multiple_choice_question_id"], name: "index_user_response_values_on_multiple_choice_question_id"
    t.index ["submission_id"], name: "index_user_response_values_on_submission_id"
    t.index ["user_id"], name: "index_user_response_values_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "mcq_options", "multiple_choice_questions"
  add_foreign_key "multiple_choice_questions", "test_papers"
  add_foreign_key "submissions", "test_papers"
  add_foreign_key "submissions", "users"
  add_foreign_key "user_response_values", "multiple_choice_questions"
  add_foreign_key "user_response_values", "submissions"
  add_foreign_key "user_response_values", "users"
end
