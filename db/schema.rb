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

ActiveRecord::Schema.define(version: 20160908171623) do

  create_table "answers", force: :cascade do |t|
    t.integer  "intent_id"
    t.text     "reply"
    t.integer  "upvotes",    default: 0
    t.integer  "downvotes",  default: 0
    t.boolean  "automatic",  default: false
    t.boolean  "active",     default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "answers", ["active"], name: "index_answers_on_active"
  add_index "answers", ["automatic"], name: "index_answers_on_automatic"
  add_index "answers", ["intent_id", "upvotes"], name: "index_answers_on_intent_id_and_upvotes"

  create_table "brands", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "name"
    t.text     "description"
    t.boolean  "active",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "brands", ["name"], name: "index_brands_on_name", unique: true

  create_table "categorized_messages", force: :cascade do |t|
    t.integer  "intent_id"
    t.integer  "message_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "categorized_messages", ["intent_id", "message_id"], name: "index_categorized_messages_on_intent_id_and_message_id"

  create_table "context_categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "active",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "context_categories", ["name"], name: "index_context_categories_on_name", unique: true

  create_table "contexts", force: :cascade do |t|
    t.integer  "context_category_id"
    t.string   "name"
    t.text     "description"
    t.boolean  "active",              default: true
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "contexts", ["context_category_id", "name"], name: "index_contexts_on_context_category_id_and_name", unique: true

  create_table "conversations", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "user_says"
    t.string   "bot_says"
    t.string   "next_step"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "conversations", ["user_id"], name: "index_conversations_on_user_id"

  create_table "intents", force: :cascade do |t|
    t.integer  "context_id"
    t.string   "name"
    t.text     "description"
    t.boolean  "active",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "intents", ["context_id", "name"], name: "index_intents_on_context_id_and_name", unique: true

  create_table "messages", force: :cascade do |t|
    t.integer  "conversation_id"
    t.text     "body"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "messages", ["body"], name: "index_messages_on_body"
  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id"

  create_table "product_types", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "active",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "product_types", ["name"], name: "index_product_types_on_name", unique: true

  create_table "products", force: :cascade do |t|
    t.integer  "product_type_id"
    t.string   "name"
    t.text     "description"
    t.boolean  "active",          default: true
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "products", ["name"], name: "index_products_on_name", unique: true

  create_table "skus", force: :cascade do |t|
    t.integer  "brand_id"
    t.string   "name"
    t.text     "description"
    t.integer  "quantity",                                 default: 1
    t.string   "color"
    t.decimal  "weight",           precision: 8, scale: 2
    t.decimal  "width",            precision: 8, scale: 2
    t.decimal  "height",           precision: 8, scale: 2
    t.decimal  "price",            precision: 8, scale: 2
    t.string   "material"
    t.text     "other_attributes"
    t.boolean  "active",                                   default: true
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
  end

  add_index "skus", ["brand_id"], name: "index_skus_on_brand_id"
  add_index "skus", ["name"], name: "index_skus_on_name"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "active",          default: true
    t.boolean  "admin",           default: false
    t.boolean  "dealer",          default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
