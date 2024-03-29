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

ActiveRecord::Schema.define(version: 20161119194908) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "question_answers", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "question_choice_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["question_choice_id"], name: "index_question_answers_on_question_choice_id", using: :btree
    t.index ["question_id"], name: "index_question_answers_on_question_id", using: :btree
  end

  create_table "question_choices", force: :cascade do |t|
    t.integer  "question_id"
    t.string   "text"
    t.boolean  "is_right_choice"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "msg_if_chosen"
    t.index ["question_id"], name: "index_question_choices_on_question_id", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.string   "text"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "question_number"
  end

  add_foreign_key "question_answers", "question_choices"
  add_foreign_key "question_answers", "questions"
  add_foreign_key "question_choices", "questions"
end
