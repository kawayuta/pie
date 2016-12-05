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

ActiveRecord::Schema.define(version: 20161127033533) do

  create_table "follows", force: :cascade do |t|
    t.string   "follower_type"
    t.integer  "follower_id"
    t.string   "followable_type"
    t.integer  "followable_id"
    t.datetime "created_at"
    t.index ["followable_id", "followable_type"], name: "fk_followables"
    t.index ["follower_id", "follower_type"], name: "fk_follows"
  end

  create_table "gets", force: :cascade do |t|
    t.string   "title"
    t.string   "getimage"
    t.text     "body"
    t.integer  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  create_table "likes", force: :cascade do |t|
    t.string   "liker_type"
    t.integer  "liker_id"
    t.string   "likeable_type"
    t.integer  "likeable_id"
    t.datetime "created_at"
    t.index ["likeable_id", "likeable_type"], name: "fk_likeables"
    t.index ["liker_id", "liker_type"], name: "fk_likes"
  end

  create_table "mentions", force: :cascade do |t|
    t.string   "mentioner_type"
    t.integer  "mentioner_id"
    t.string   "mentionable_type"
    t.integer  "mentionable_id"
    t.datetime "created_at"
    t.index ["mentionable_id", "mentionable_type"], name: "fk_mentionables"
    t.index ["mentioner_id", "mentioner_type"], name: "fk_mentions"
  end

  create_table "presents", force: :cascade do |t|
    t.string   "title"
    t.string   "brand"
    t.integer  "price"
    t.string   "image"
    t.integer  "myage"
    t.integer  "youage"
    t.string   "cat"
    t.string   "man"
    t.string   "enquete"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "created_by"
    t.integer  "updated_by"
    t.string   "amazon_url"
    t.string   "amazon_title"
    t.integer  "amazon_price"
    t.integer  "cached_votes_total",      default: 0
    t.integer  "cached_votes_score",      default: 0
    t.integer  "cached_votes_up",         default: 0
    t.integer  "cached_votes_down",       default: 0
    t.integer  "cached_weighted_score",   default: 0
    t.integer  "cached_weighted_total",   default: 0
    t.float    "cached_weighted_average", default: 0.0
    t.index ["cached_votes_down"], name: "index_presents_on_cached_votes_down"
    t.index ["cached_votes_score"], name: "index_presents_on_cached_votes_score"
    t.index ["cached_votes_total"], name: "index_presents_on_cached_votes_total"
    t.index ["cached_votes_up"], name: "index_presents_on_cached_votes_up"
    t.index ["cached_weighted_average"], name: "index_presents_on_cached_weighted_average"
    t.index ["cached_weighted_score"], name: "index_presents_on_cached_weighted_score"
    t.index ["cached_weighted_total"], name: "index_presents_on_cached_weighted_total"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "email",                      default: "", null: false
    t.string   "encrypted_password",         default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",              default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
    t.string   "age"
    t.datetime "birthday"
    t.boolean  "cat_baby_switch"
    t.boolean  "cat_prescool_switch"
    t.boolean  "cat_juniorscool_switch"
    t.boolean  "cat_highscool_switch"
    t.boolean  "cat_universityscool_switch"
    t.boolean  "cat_senior_switch"
    t.boolean  "cat_age10s_switch"
    t.boolean  "cat_age20s_switch"
    t.boolean  "cat_age30s_switch"
    t.boolean  "cat_age40s_switch"
    t.boolean  "cat_age50s_switch"
    t.boolean  "cat_age60s_switch"
    t.boolean  "cat_age70s80s90s_switch"
    t.         "default"
    t.         "null"
    t.string   "avatar"
    t.integer  "followees_count",            default: 0
    t.integer  "followers_count",            default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.string   "votable_type"
    t.integer  "votable_id"
    t.string   "voter_type"
    t.integer  "voter_id"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  end

end
