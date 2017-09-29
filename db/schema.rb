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

ActiveRecord::Schema.define(version: 20170928171840) do

  create_table "admin_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "first_name",      limit: 25
    t.string "last_name",       limit: 50
    t.string "email",           limit: 100, null: false
    t.string "username",        limit: 25
    t.string "password_digest"
  end

  create_table "authors", primary_key: "author_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 50
  end

  create_table "authors_publications", primary_key: ["publication_id", "author_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "publication_id", default: 0, null: false
    t.integer "author_id",      default: 0, null: false
  end

  create_table "journals", primary_key: "journal_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 300
  end

  create_table "journals_publications", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "publication_id", null: false
    t.integer "journal_id",     null: false
  end

  create_table "news", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title",      limit: 1000
    t.string   "image",      limit: 2000
    t.string   "content",    limit: 2000
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "news_articles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title",              limit: 1000
    t.string   "content",            limit: 10000
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "source",             limit: 1000
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "next_case_reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "when",       limit: 500
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "publications", primary_key: "publication_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "name"
    t.integer "year_published",                null: false
    t.string  "month_published", limit: 20
    t.integer "day_published"
    t.string  "citation",        limit: 1000
    t.string  "source",          limit: 1000
    t.string  "abstract",        limit: 10000
    t.string  "first_author"
    t.string  "last_author"
  end

  create_table "ramp", primary_key: "ramp_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                   limit: 100, null: false
    t.string   "definition",             limit: 500
    t.json     "m_ages"
    t.json     "m_valsArr2d"
    t.json     "f_ages"
    t.json     "f_valsArr2d"
    t.string   "vertebrae_number",       limit: 3
    t.string   "scan_img_file_name"
    t.string   "scan_img_content_type"
    t.integer  "scan_img_file_size"
    t.datetime "scan_img_updated_at"
    t.string   "chart_img_file_name"
    t.string   "chart_img_content_type"
    t.integer  "chart_img_file_size"
    t.datetime "chart_img_updated_at"
  end

  create_table "team_members", primary_key: "team_member_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "last_name",          limit: 30
    t.string   "first_name",         limit: 30
    t.string   "degree"
    t.string   "title"
    t.string   "headshot",           limit: 1000
    t.string   "bio",                limit: 5000
    t.string   "team_member_type",   limit: 50
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

end
