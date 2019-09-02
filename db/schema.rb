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

ActiveRecord::Schema.define(version: 20190830215611) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "article_translations", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "lang"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_article_translations_on_article_id", using: :btree
  end

  create_table "articles", force: :cascade do |t|
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "status",           default: 0
    t.string   "image_id",         default: ""
    t.integer  "practice_area_id"
    t.index ["practice_area_id"], name: "index_articles_on_practice_area_id", using: :btree
  end

  create_table "articles_tags", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_articles_tags_on_article_id", using: :btree
    t.index ["tag_id"], name: "index_articles_tags_on_tag_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "content"
    t.integer  "status"
    t.integer  "reference_type"
    t.integer  "reference_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "practice_area_translations", force: :cascade do |t|
    t.integer  "practice_area_id"
    t.string   "name"
    t.integer  "lang"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["practice_area_id"], name: "index_practice_area_translations_on_practice_area_id", using: :btree
  end

  create_table "practice_areas", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "key"
  end

  create_table "tag_translations", force: :cascade do |t|
    t.integer  "tag_id"
    t.string   "name"
    t.integer  "lang"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_tag_translations_on_tag_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean  "allow_password_change",  default: false
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image_id",               default: ""
    t.string   "email"
    t.integer  "rol",                    default: 0
    t.json     "tokens"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  end

  add_foreign_key "article_translations", "articles"
  add_foreign_key "articles_tags", "articles"
  add_foreign_key "articles_tags", "tags"
  add_foreign_key "practice_area_translations", "practice_areas"
  add_foreign_key "tag_translations", "tags"
end
