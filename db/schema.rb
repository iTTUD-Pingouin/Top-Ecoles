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

ActiveRecord::Schema.define(version: 2018_06_24_155245) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "colleges", force: :cascade do |t|
    t.string "address"
    t.integer "total_fees"
    t.bigint "school_id"
    t.text "sections", default: [], array: true
    t.text "options", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uai"
    t.string "commune"
    t.text "activities", default: [], array: true
    t.string "statut"
    t.boolean "pensionnat"
    t.integer "rating"
    t.string "name"
    t.integer "cp"
    t.integer "code_commune"
    t.string "departement"
    t.integer "code_departement"
    t.string "academie"
    t.string "region"
    t.integer "latitude"
    t.integer "longitude"
    t.boolean "has_maternelle", default: false
    t.boolean "has_elementaire", default: false
    t.boolean "has_generale_way", default: false
    t.boolean "has_techno_way", default: false
    t.boolean "has_pro_way", default: false
    t.integer "telephone"
    t.string "website"
    t.boolean "has_restauration", default: false
    t.boolean "has_hebergement", default: false
    t.boolean "has_ulis", default: false
    t.boolean "has_apprentissage", default: false
    t.boolean "has_segpa", default: false
    t.boolean "has_art_section", default: false
    t.boolean "has_cinema_section", default: false
    t.boolean "has_theatre_section", default: false
    t.boolean "has_sport_section", default: false
    t.boolean "has_international_section", default: false
    t.boolean "has_european_section", default: false
    t.boolean "has_agricole_section", default: false
    t.boolean "has_military_section", default: false
    t.boolean "has_metiers_section", default: false
    t.boolean "has_post_bac_sections", default: false
    t.boolean "is_educ_priority_zone", default: false
    t.integer "students_number"
    t.string "onisep_view"
    t.string "main_photo"
    t.string "logo"
    t.string "photo1"
    t.string "photo2"
    t.string "photo3"
    t.string "photo4"
    t.string "photo5"
    t.string "photo6"
    t.string "video1"
    t.string "video2"
    t.string "description_etablissement"
    t.index ["school_id"], name: "index_colleges_on_school_id"
  end

  create_table "filieres", force: :cascade do |t|
    t.string "name"
    t.float "success_rate"
    t.float "mention_rate"
    t.float "tb_mention_rate"
    t.float "ab_mention_rate"
    t.float "b_mention_rate"
    t.float "churn_rate"
    t.bigint "lycee_id"
    t.string "serie"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lycee_id"], name: "index_filieres_on_lycee_id"
  end

  create_table "lycees", force: :cascade do |t|
    t.string "address"
    t.integer "total_fees"
    t.bigint "school_id"
    t.text "sections", default: [], array: true
    t.text "options", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uai"
    t.string "commune"
    t.string "statut"
    t.integer "rating"
    t.index ["school_id"], name: "index_lycees_on_school_id"
  end

  create_table "primaires", force: :cascade do |t|
    t.string "address"
    t.integer "total_fees"
    t.bigint "school_id"
    t.text "sections", default: [], array: true
    t.text "options", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uai"
    t.string "commune"
    t.index ["school_id"], name: "index_primaires_on_school_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.string "commune"
    t.string "statut"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "colleges", "schools"
  add_foreign_key "filieres", "lycees"
  add_foreign_key "lycees", "schools"
  add_foreign_key "primaires", "schools"
end
