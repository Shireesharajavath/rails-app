ActiveRecord::Schema[8.0].define(version: 2025_10_01_053012) do
  create_table "todos", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "scheduled_time"
    t.datetime "expected_completion"
    t.string "priority"
    t.string "status"
    t.integer "user_id"
    t.index ["user_id"], name: "index_todos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "api_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "photo_url"
  end
end
