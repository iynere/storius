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

ActiveRecord::Schema.define(version: 20170313193632) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_trgm"
  enable_extension "unaccent"

  create_table "annotations", force: :cascade do |t|
    t.integer  "start_idx",  null: false
    t.integer  "length",     null: false
    t.text     "content",    null: false
    t.integer  "stori_id",   null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stori_id"], name: "index_annotations_on_stori_id", using: :btree
    t.index ["user_id"], name: "index_annotations_on_user_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.text     "content",    null: false
    t.integer  "stori_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stori_id"], name: "index_comments_on_stori_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.string   "searchable_type"
    t.integer  "searchable_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id", using: :btree
  end

  create_table "storis", force: :cascade do |t|
    t.string   "title",                           null: false
    t.string   "author",                          null: false
    t.text     "content",                         null: false
    t.string   "image_url"
    t.string   "header_image_url"
    t.text     "tags",               default: [],              array: true
    t.json     "audio_video",        default: {}
    t.json     "metadata",           default: {}
    t.integer  "user_id",                         null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.index ["author"], name: "index_storis_on_author", using: :btree
    t.index ["title", "author"], name: "index_storis_on_title_and_author", unique: true, using: :btree
    t.index ["title"], name: "index_storis_on_title", using: :btree
    t.index ["user_id"], name: "index_storis_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",           null: false
    t.string   "email",              null: false
    t.string   "password_digest",    null: false
    t.string   "session_token",      null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.text     "bio"
    t.string   "image_url"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"

    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id",      null: false
    t.integer  "votable_id",   null: false
    t.string   "votable_type", null: false
    t.integer  "status",       null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_votes_on_user_id", using: :btree
    t.index ["votable_id"], name: "index_votes_on_votable_id", using: :btree
  end

end
