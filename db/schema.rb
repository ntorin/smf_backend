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

ActiveRecord::Schema.define(version: 20171101223045) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blocks", force: :cascade do |t|
    t.integer  "blocker_id"
    t.integer  "blocked_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conversation_users", force: :cascade do |t|
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.boolean  "is_admin"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "is_group"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "credit_histories", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "transaction"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "feeds", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "feed_type"
    t.integer  "goto_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "follows", force: :cascade do |t|
    t.integer  "following_id"
    t.integer  "follower_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "friends", force: :cascade do |t|
    t.integer  "friend_one"
    t.integer  "friend_two"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "group_tags", force: :cascade do |t|
    t.integer  "group_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.integer  "creator_id"
    t.string   "handle"
    t.string   "name"
    t.text     "description"
    t.integer  "member_count"
    t.integer  "topic_count"
    t.integer  "post_count"
    t.decimal  "lat",          precision: 10, scale: 6
    t.decimal  "lng",          precision: 10, scale: 6
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "notification_type"
    t.text     "description"
    t.boolean  "is_seen"
    t.integer  "goto_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "post_likes", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.boolean  "is_like"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "topic_id"
    t.integer  "creator_id"
    t.text     "content"
    t.integer  "likes"
    t.integer  "dislikes"
    t.boolean  "is_op"
    t.boolean  "is_anonymous"
    t.datetime "edit_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "private_messages", force: :cascade do |t|
    t.integer  "conversation_id"
    t.integer  "sender_id"
    t.text     "message"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "reports", force: :cascade do |t|
    t.integer  "reporter_id"
    t.integer  "reported_id"
    t.string   "reason"
    t.text     "comment"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "topic_tags", force: :cascade do |t|
    t.integer  "topic_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topics", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "creator_id"
    t.string   "title"
    t.integer  "topic_type"
    t.datetime "last_post_date"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "email"
    t.json     "tokens"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "accountid"
    t.string   "name"
    t.date     "birthday"
    t.integer  "follower_count"
    t.integer  "following_count"
    t.integer  "friend_count"
    t.integer  "credits"
    t.integer  "credit_multiplier"
    t.integer  "total_likes"
    t.integer  "total_dislikes"
    t.integer  "topic_count"
    t.integer  "post_count"
    t.integer  "group_count"
    t.boolean  "accepted_tos"
    t.boolean  "verified"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  end

end
