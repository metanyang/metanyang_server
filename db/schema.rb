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

ActiveRecord::Schema.define(version: 20180901170700) do

  create_table "cats", force: :cascade do |t|
    t.string "cat_id"
    t.integer "center_id"
    t.text "thumbnail_url"
    t.text "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cat_id"], name: "index_cats_on_cat_id"
    t.index ["center_id"], name: "index_cats_on_center_id"
  end

  create_table "center_goods", force: :cascade do |t|
    t.integer "center_id"
    t.integer "good_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["center_id"], name: "index_center_goods_on_center_id"
    t.index ["good_id"], name: "index_center_goods_on_good_id"
  end

  create_table "centers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "center_id"
    t.index ["name"], name: "index_centers_on_name"
  end

  create_table "goods", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_goods_on_name"
  end

  create_table "result_mails", force: :cascade do |t|
    t.integer "sponsership_id"
    t.string "image"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sponsership_id"], name: "index_result_mails_on_sponsership_id"
  end

  create_table "sidos", force: :cascade do |t|
    t.string "sido_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sido_id"], name: "index_sidos_on_sido_id"
  end

  create_table "sigungus", force: :cascade do |t|
    t.string "sigungu_id"
    t.string "name"
    t.integer "sido_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sido_id"], name: "index_sigungus_on_sido_id"
    t.index ["sigungu_id"], name: "index_sigungus_on_sigungu_id"
  end

  create_table "sponserships", force: :cascade do |t|
    t.string "email"
    t.integer "good_id"
    t.integer "center_id"
    t.datetime "received_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "address"
    t.string "s_count"
    t.string "s_weight"
    t.index ["center_id"], name: "index_sponserships_on_center_id"
    t.index ["good_id"], name: "index_sponserships_on_good_id"
  end

end
