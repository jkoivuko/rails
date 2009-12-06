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

ActiveRecord::Schema.define(:version => 20091206193837) do

  create_table "admins", :force => true do |t|
    t.string "name"
  end

  create_table "admins_users", :id => false, :force => true do |t|
    t.integer "admin_id"
    t.integer "user_id"
  end

  add_index "admins_users", ["admin_id"], :name => "index_admins_users_on_admin_id"
  add_index "admins_users", ["user_id"], :name => "index_admins_users_on_user_id"

  create_table "course_feedbacks", :force => true do |t|
    t.integer  "instance_id"
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exercisegroups", :force => true do |t|
    t.string   "room"
    t.string   "name"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "instance_id"
    t.datetime "start_date"
    t.datetime "end_date"
  end

  create_table "friendships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friendships", ["friend_id"], :name => "index_friendships_on_friend_id"
  add_index "friendships", ["user_id"], :name => "index_friendships_on_user_id"

  create_table "instances", :force => true do |t|
    t.string   "description"
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "course_id"
  end

  create_table "newsfeeds", :force => true do |t|
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registrations", :force => true do |t|
    t.integer "exercisegroup_id"
    t.integer "user_id"
  end

  add_index "registrations", ["exercisegroup_id"], :name => "index_registrations_on_exercisegroup_id"
  add_index "registrations", ["user_id"], :name => "index_registrations_on_user_id"

  create_table "roles", :force => true do |t|
    t.string "name"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id"], :name => "index_roles_users_on_role_id"
  add_index "roles_users", ["user_id"], :name => "index_roles_users_on_user_id"

  create_table "separate_exams", :force => true do |t|
    t.string   "name"
    t.integer  "course_id"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "hashed_password"
    t.string   "realname"
    t.string   "studentnum"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
