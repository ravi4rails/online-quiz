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

ActiveRecord::Schema.define(version: 2018_09_21_155517) do

  create_table "mcq_options", force: :cascade do |t|
    t.string "option"
    t.integer "multiple_choice_question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["multiple_choice_question_id"], name: "index_mcq_options_on_multiple_choice_question_id"
  end

  create_table "multiple_choice_questions", force: :cascade do |t|
    t.text "question"
    t.integer "test_paper_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sequence_number"
    t.index ["test_paper_id"], name: "index_multiple_choice_questions_on_test_paper_id"
  end

  create_table "test_papers", force: :cascade do |t|
    t.string "name"
    t.date "date_to_take_test"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
