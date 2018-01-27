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

ActiveRecord::Schema.define(version: 20180124120257) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blocks", force: :cascade do |t|
    t.integer  "blocker_id"
    t.integer  "blocked_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conversation_messages", force: :cascade do |t|
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.text     "message"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "conversation_users", force: :cascade do |t|
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.string   "role",            default: "user"
    t.integer  "unreads",         default: 0
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "is_group",          default: false
    t.integer  "member_count",      default: 0
    t.integer  "message_count",     default: 0
    t.text     "last_message"
    t.datetime "last_message_date"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
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
    t.integer  "group_id"
    t.integer  "source_id"
    t.string   "feed_type"
    t.string   "deep_link"
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
    t.boolean  "is_accepted", default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "group_users", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.string   "role",       default: "user"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "groups", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "identifier"
    t.string   "name"
    t.text     "description"
    t.string   "group_type",                  default: "public"
    t.string   "tags",                        default: ""
    t.integer  "member_count",                default: 0
    t.integer  "topic_count",                 default: 0
    t.integer  "post_count",                  default: 0
    t.decimal  "lat",                         default: "0.0"
    t.decimal  "{:precision=>10, :scale=>6}", default: "0.0"
    t.decimal  "lng",                         default: "0.0"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.index ["identifier"], name: "index_groups_on_identifier", unique: true, using: :btree
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "notification_type"
    t.text     "description"
    t.boolean  "is_seen"
    t.string   "deep_link"
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
    t.integer  "group_id"
    t.integer  "topic_id"
    t.integer  "user_id"
    t.text     "content"
    t.integer  "likes",        default: 0
    t.integer  "dislikes",     default: 0
    t.boolean  "is_op"
    t.boolean  "is_anonymous"
    t.datetime "edit_date"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "referrals", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "referrer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "reports", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "reporter_id"
    t.integer  "reported_id"
    t.string   "reason"
    t.text     "comment"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "topics", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.string   "title"
    t.string   "topic_type"
    t.string   "preview"
    t.boolean  "is_anonymous"
    t.boolean  "is_pinned",      default: false
    t.boolean  "is_locked",      default: false
    t.string   "tags"
    t.integer  "post_count",     default: 0
    t.datetime "last_post_date"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
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
    t.string   "identifier"
    t.string   "name"
    t.string   "role",                   default: "user"
    t.string   "blurb"
    t.date     "birthday"
    t.integer  "referral_count",         default: 0
    t.integer  "follower_count",         default: 0
    t.integer  "following_count",        default: 0
    t.integer  "friend_count",           default: 0
    t.integer  "credits",                default: 0
    t.integer  "credit_multiplier",      default: 1
    t.integer  "total_likes",            default: 0
    t.integer  "total_dislikes",         default: 0
    t.integer  "topic_count",            default: 0
    t.integer  "post_count",             default: 0
    t.integer  "group_count",            default: 0
    t.boolean  "accepted_tos",           default: false
    t.boolean  "verified",               default: false
    t.boolean  "is_banned",              default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["identifier"], name: "index_users_on_identifier", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  end

end
