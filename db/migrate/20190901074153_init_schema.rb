class InitSchema < ActiveRecord::Migration[5.2]
  def up
    create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "brands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.string "name", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "cards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.integer "user_id", null: false
      t.string "customer_id", null: false
      t.string "card_id", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.string "name"
      t.string "ancestry"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.bigint "user_id", null: false
      t.bigint "product_id", null: false
      t.text "comment", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["product_id"], name: "index_comments_on_product_id"
      t.index ["user_id"], name: "index_comments_on_user_id"
    end
    create_table "evaluations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.bigint "user_id", null: false
      t.integer "evaluator_id", null: false
      t.text "comment", null: false
      t.string "satisfaction_level", null: false
      t.boolean "seller_bit", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["user_id"], name: "index_evaluations_on_user_id"
    end
    create_table "first_name_to_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.string "email"
      t.string "encrypted_password"
      t.string "last_name"
    end
    create_table "images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.bigint "product_id", null: false
      t.string "image", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["product_id"], name: "index_images_on_product_id"
    end
    create_table "likes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.bigint "user_id", null: false
      t.bigint "product_id", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["product_id"], name: "index_likes_on_product_id"
      t.index ["user_id"], name: "index_likes_on_user_id"
    end
    create_table "messages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.bigint "user_id", null: false
      t.bigint "product_id", null: false
      t.text "message", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["product_id"], name: "index_messages_on_product_id"
      t.index ["user_id"], name: "index_messages_on_user_id"
    end
    create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.string "name", null: false
      t.string "state", null: false
      t.string "price", null: false
      t.boolean "sold"
      t.bigint "user_id"
      t.integer "buyer_id"
      t.string "cost_bearer", null: false
      t.string "delivery_method"
      t.string "address_id", null: false
      t.integer "day_to_ship", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.bigint "category_id", null: false
      t.string "brand"
      t.string "size"
      t.index ["category_id"], name: "index_products_on_category_id"
      t.index ["user_id"], name: "index_products_on_user_id"
    end
    create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.string "email", default: "", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "nickname", null: false
      t.date "birthday", null: false
      t.string "first_name", null: false
      t.string "last_name", null: false
      t.string "first_name_kana", null: false
      t.string "last_name_kana", null: false
      t.integer "phone_number", null: false
      t.string "postcode", null: false
      t.string "prefecture", null: false
      t.string "city", null: false
      t.string "block", null: false
      t.string "building"
      t.integer "wallet", null: false
      t.index ["email"], name: "index_users_on_email", unique: true
      t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    end
    add_foreign_key "comments", "products"
    add_foreign_key "comments", "users"
    add_foreign_key "evaluations", "users"
    add_foreign_key "images", "products"
    add_foreign_key "likes", "products"
    add_foreign_key "likes", "users"
    add_foreign_key "messages", "products"
    add_foreign_key "messages", "users"
    add_foreign_key "products", "categories"
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "The initial migration is not revertable"
  end
end
