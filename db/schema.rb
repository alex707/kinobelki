ActiveRecord::Schema.define(version: 20160404183240) do

  create_table "comments", force: :cascade do |t|
    t.string   "commenter"
    t.text     "body"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["project_id"], name: "index_comments_on_project_id"

  create_table "projects", force: :cascade do |t|
    t.string   "project_name"
    t.string   "project_description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "project_avatar_file_name"
    t.string   "project_avatar_content_type"
    t.integer  "project_avatar_file_size"
    t.datetime "project_avatar_updated_at"
    t.integer  "user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.text     "review_pos"
    t.text     "review_neg"
    t.datetime "published_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "reviews", ["project_id"], name: "index_reviews_on_project_id"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                    default: "", null: false
    t.string   "encrypted_password",       default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",            default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "user_avatar_file_name"
    t.string   "user_avatar_content_type"
    t.integer  "user_avatar_file_size"
    t.datetime "user_avatar_updated_at"
    t.text     "user_description"
    t.string   "user_nickname"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
