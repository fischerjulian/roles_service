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

ActiveRecord::Schema.define(version: 20150618083041) do

  create_table "categories", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_tasks", id: false, force: true do |t|
    t.integer "category_id", null: false
    t.integer "task_id",     null: false
  end

  add_index "categories_tasks", ["task_id", "category_id"], name: "index_categories_tasks_on_task_id_and_category_id", unique: true

  create_table "employees", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "employees_roles", id: false, force: true do |t|
    t.integer "employee_id", null: false
    t.integer "role_id",     null: false
  end

  add_index "employees_roles", ["employee_id", "role_id"], name: "index_employees_roles_on_employee_id_and_role_id"
  add_index "employees_roles", ["role_id", "employee_id"], name: "index_employees_roles_on_role_id_and_employee_id"

  create_table "org_units", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "parent_unit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "org_units", ["parent_unit_id"], name: "index_org_units_on_parent_unit_id"

  create_table "roles", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks", ["role_id"], name: "index_tasks_on_role_id"

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
