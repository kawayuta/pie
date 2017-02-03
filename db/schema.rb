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

ActiveRecord::Schema.define(version: 20170117210727) do

  create_table "collectionrelations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "relay_get_post_id"
    t.integer  "relay_user_id"
    t.string   "relay_collection_title"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "collections", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "collection_name",    limit: 65535
    t.text     "collection_detaile", limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.string   "title"
    t.text     "body",             limit: 65535
    t.string   "subject"
    t.integer  "user_id",                        null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "follows", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "follower_type"
    t.integer  "follower_id"
    t.string   "followable_type"
    t.integer  "followable_id"
    t.datetime "created_at"
    t.index ["followable_id", "followable_type"], name: "fk_followables", using: :btree
    t.index ["follower_id", "follower_type"], name: "fk_follows", using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "gets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "getimage"
    t.string   "getimage_cache"
    t.string   "brand"
    t.text     "body",              limit: 65535
    t.integer  "price"
    t.integer  "body_height"
    t.integer  "body_width"
    t.integer  "body_bust"
    t.integer  "body_west"
    t.integer  "body_hip"
    t.integer  "shoulder_width"
    t.integer  "leg_height"
    t.integer  "leg_width"
    t.integer  "foot_height"
    t.integer  "arm_height"
    t.integer  "arm_width"
    t.integer  "ring_finger_width"
    t.float    "latitude",          limit: 24
    t.float    "longitude",         limit: 24
    t.string   "get_cat"
    t.boolean  "location_check",                  default: true
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.integer  "created_by"
    t.integer  "updated_by"
    t.text     "shopcat",           limit: 65535
  end

  create_table "likes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "liker_type"
    t.integer  "liker_id"
    t.string   "likeable_type"
    t.integer  "likeable_id"
    t.datetime "created_at"
    t.index ["likeable_id", "likeable_type"], name: "fk_likeables", using: :btree
    t.index ["liker_id", "liker_type"], name: "fk_likes", using: :btree
  end

  create_table "mentions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "mentioner_type"
    t.integer  "mentioner_id"
    t.string   "mentionable_type"
    t.integer  "mentionable_id"
    t.datetime "created_at"
    t.index ["mentionable_id", "mentionable_type"], name: "fk_mentionables", using: :btree
    t.index ["mentioner_id", "mentioner_type"], name: "fk_mentions", using: :btree
  end

  create_table "polls", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "present_id"
    t.integer  "poll_id"
    t.integer  "poll_age"
    t.boolean  "poll_check", default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "presents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "brand"
    t.integer  "price"
    t.string   "image"
    t.integer  "myage"
    t.integer  "youage"
    t.string   "cat"
    t.string   "man"
    t.string   "enquete"
    t.string   "poll_1"
    t.string   "poll_2"
    t.string   "poll_3"
    t.string   "poll_4"
    t.float    "latitude",                limit: 24
    t.float    "longitude",               limit: 24
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.integer  "created_by"
    t.integer  "updated_by"
    t.string   "amazon_url"
    t.string   "amazon_title"
    t.integer  "amazon_price"
    t.integer  "cached_votes_total",                 default: 0
    t.integer  "cached_votes_score",                 default: 0
    t.integer  "cached_votes_up",                    default: 0
    t.integer  "cached_votes_down",                  default: 0
    t.integer  "cached_weighted_score",              default: 0
    t.integer  "cached_weighted_total",              default: 0
    t.float    "cached_weighted_average", limit: 24, default: 0.0
    t.index ["cached_votes_down"], name: "index_presents_on_cached_votes_down", using: :btree
    t.index ["cached_votes_score"], name: "index_presents_on_cached_votes_score", using: :btree
    t.index ["cached_votes_total"], name: "index_presents_on_cached_votes_total", using: :btree
    t.index ["cached_votes_up"], name: "index_presents_on_cached_votes_up", using: :btree
    t.index ["cached_weighted_average"], name: "index_presents_on_cached_weighted_average", using: :btree
    t.index ["cached_weighted_score"], name: "index_presents_on_cached_weighted_score", using: :btree
    t.index ["cached_weighted_total"], name: "index_presents_on_cached_weighted_total", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.float    "latitude",               limit: 24
    t.float    "longitude",              limit: 24
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.string   "email",                             default: "",           null: false
    t.string   "encrypted_password",                default: "",           null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,            null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
    t.string   "age"
    t.datetime "birthday"
    t.string   "avatar",                            default: "cherry.jpg"
    t.integer  "followees_count",                   default: 0
    t.integer  "followers_count",                   default: 0
    t.integer  "body_height"
    t.integer  "body_width"
    t.integer  "body_bust"
    t.integer  "body_west"
    t.integer  "body_hip"
    t.integer  "shoulder_width"
    t.integer  "leg_height"
    t.integer  "leg_width"
    t.integer  "foot_height"
    t.integer  "arm_height"
    t.integer  "arm_width"
    t.integer  "ring_finger_width"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "votes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "votable_type"
    t.integer  "votable_id"
    t.string   "voter_type"
    t.integer  "voter_id"
    t.boolean  "vote_flag",    default: false, null: false
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree
  end

end
