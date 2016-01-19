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

ActiveRecord::Schema.define(version: 20160118144808) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_managements", force: :cascade do |t|
    t.integer  "print_job_id",                          null: false
    t.decimal  "hours",        precision: 15, scale: 2, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "account_managements", ["print_job_id"], name: "index_account_managements_on_print_job_id", using: :btree

  create_table "addresses", force: :cascade do |t|
    t.integer  "customer_id"
    t.string   "name"
    t.string   "line_1",      null: false
    t.string   "line_2"
    t.string   "line_3"
    t.string   "city",        null: false
    t.string   "postcode",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "addresses", ["customer_id"], name: "index_addresses_on_customer_id", using: :btree

  create_table "brand_addresses", force: :cascade do |t|
    t.integer  "brand_id"
    t.string   "name"
    t.string   "line_1",     null: false
    t.string   "line_2"
    t.string   "line_3"
    t.string   "city",       null: false
    t.string   "postcode",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "brand_addresses", ["brand_id"], name: "index_brand_addresses_on_brand_id", unique: true, using: :btree

  create_table "brands", force: :cascade do |t|
    t.string   "name",                      null: false
    t.boolean  "display",    default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "brand_type", default: 0,    null: false
  end

  add_index "brands", ["name"], name: "index_brands_on_name", unique: true, using: :btree

  create_table "contacts", force: :cascade do |t|
    t.integer  "customer_id",          null: false
    t.string   "name",                 null: false
    t.string   "email"
    t.string   "phone"
    t.string   "role",                 null: false
    t.datetime "made_main_contact_at"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "contacts", ["customer_id"], name: "index_contacts_on_customer_id", using: :btree
  add_index "contacts", ["made_main_contact_at"], name: "index_contacts_on_made_main_contact_at", using: :btree
  add_index "contacts", ["name"], name: "index_contacts_on_name", unique: true, using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "name",                                                   null: false
    t.decimal  "credit_limit",     precision: 7, scale: 2, default: 0.0, null: false
    t.decimal  "amount_on_credit", precision: 7, scale: 2, default: 0.0
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
  end

  add_index "customers", ["name"], name: "index_customers_on_name", unique: true, using: :btree

  create_table "designs", force: :cascade do |t|
    t.integer  "print_job_id",                          null: false
    t.decimal  "hours",        precision: 15, scale: 2, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "designs", ["print_job_id"], name: "index_designs_on_print_job_id", using: :btree

  create_table "job_specifications", force: :cascade do |t|
    t.decimal  "hours",        precision: 15, scale: 2, null: false
    t.integer  "print_job_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "job_specifications", ["print_job_id"], name: "index_job_specifications_on_print_job_id", using: :btree

  create_table "labour_items", force: :cascade do |t|
    t.integer  "print_job_id",                          null: false
    t.integer  "labour_id",                             null: false
    t.decimal  "hours",        precision: 15, scale: 2, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "labour_items", ["labour_id"], name: "index_labour_items_on_labour_id", using: :btree
  add_index "labour_items", ["print_job_id"], name: "index_labour_items_on_print_job_id", using: :btree

  create_table "labours", force: :cascade do |t|
    t.string   "name",                                              null: false
    t.text     "description"
    t.decimal  "per_hour",    precision: 5, scale: 2,               null: false
    t.integer  "mark_up",                             default: 100, null: false
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  add_index "labours", ["name"], name: "index_labours_on_name", unique: true, using: :btree

  create_table "mileages", force: :cascade do |t|
    t.decimal  "miles",        precision: 15, scale: 2, null: false
    t.integer  "print_job_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "mileages", ["print_job_id"], name: "index_mileages_on_print_job_id", using: :btree

  create_table "print_jobs", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "print_jobs", ["project_id", "name"], name: "index_print_jobs_on_project_id_and_name", unique: true, using: :btree
  add_index "print_jobs", ["project_id"], name: "index_print_jobs_on_project_id", using: :btree

  create_table "product_items", force: :cascade do |t|
    t.decimal  "area",         precision: 15, scale: 3, null: false
    t.integer  "print_job_id",                          null: false
    t.integer  "product_id",                            null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "product_items", ["print_job_id"], name: "index_product_items_on_print_job_id", using: :btree
  add_index "product_items", ["product_id"], name: "index_product_items_on_product_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name",                                                 null: false
    t.text     "description"
    t.decimal  "substrate_cost", precision: 5, scale: 2,               null: false
    t.decimal  "hardware_cost",  precision: 5, scale: 2
    t.decimal  "ink_cost",       precision: 5, scale: 2
    t.decimal  "printer_cost",   precision: 5, scale: 2
    t.integer  "mark_up",                                default: 100, null: false
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
  end

  add_index "products", ["name"], name: "index_products_on_name", unique: true, using: :btree

  create_table "projects", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "brand_id"
    t.string   "name",                            null: false
    t.text     "description"
    t.integer  "status",              default: 0
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "shipping_address_id"
    t.integer  "billing_address_id"
  end

  add_index "projects", ["billing_address_id"], name: "index_projects_on_billing_address_id", using: :btree
  add_index "projects", ["brand_id"], name: "index_projects_on_brand_id", using: :btree
  add_index "projects", ["customer_id"], name: "index_projects_on_customer_id", using: :btree
  add_index "projects", ["shipping_address_id"], name: "index_projects_on_shipping_address_id", using: :btree
  add_index "projects", ["status"], name: "completed", where: "(status = 2)", using: :btree
  add_index "projects", ["status"], name: "index_projects_on_status", using: :btree
  add_index "projects", ["status"], name: "quoted", where: "(status = 0)", using: :btree
  add_index "projects", ["status"], name: "sold", where: "(status = 1)", using: :btree

  create_table "sundry_items", force: :cascade do |t|
    t.string   "name",                                  null: false
    t.decimal  "cost",         precision: 15, scale: 2, null: false
    t.integer  "print_job_id",                          null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "sundry_items", ["print_job_id"], name: "index_sundry_items_on_print_job_id", using: :btree

  create_table "supporting_product_items", force: :cascade do |t|
    t.decimal  "area",                  precision: 15, scale: 3, null: false
    t.integer  "supporting_product_id",                          null: false
    t.integer  "print_job_id",                                   null: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  add_index "supporting_product_items", ["print_job_id"], name: "index_supporting_product_items_on_print_job_id", using: :btree
  add_index "supporting_product_items", ["supporting_product_id"], name: "index_supporting_product_items_on_supporting_product_id", using: :btree

  create_table "supporting_products", force: :cascade do |t|
    t.string   "name",                                                 null: false
    t.text     "description"
    t.decimal  "substrate_cost", precision: 7, scale: 2,               null: false
    t.integer  "mark_up",                                default: 100, null: false
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
  end

  add_index "supporting_products", ["name"], name: "index_supporting_products_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email",                                          null: false
    t.boolean  "admin",                          default: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "encrypted_password", limit: 128
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "account_managements", "print_jobs", on_delete: :cascade
  add_foreign_key "addresses", "customers", on_delete: :cascade
  add_foreign_key "brand_addresses", "brands", on_delete: :cascade
  add_foreign_key "contacts", "customers", on_delete: :cascade
  add_foreign_key "designs", "print_jobs", on_delete: :cascade
  add_foreign_key "job_specifications", "print_jobs", on_delete: :cascade
  add_foreign_key "labour_items", "labours"
  add_foreign_key "labour_items", "print_jobs", on_delete: :cascade
  add_foreign_key "mileages", "print_jobs", on_delete: :cascade
  add_foreign_key "print_jobs", "projects", on_delete: :cascade
  add_foreign_key "product_items", "print_jobs", on_delete: :cascade
  add_foreign_key "product_items", "products"
  add_foreign_key "projects", "addresses", column: "billing_address_id", on_delete: :cascade
  add_foreign_key "projects", "addresses", column: "shipping_address_id", on_delete: :cascade
  add_foreign_key "projects", "brands", on_delete: :cascade
  add_foreign_key "projects", "customers", on_delete: :cascade
  add_foreign_key "sundry_items", "print_jobs", on_delete: :cascade
  add_foreign_key "supporting_product_items", "print_jobs"
  add_foreign_key "supporting_product_items", "supporting_products", on_delete: :cascade
end