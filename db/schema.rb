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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130520052712) do

  create_table "api_food_items", :force => true do |t|
    t.string   "name_en"
    t.string   "name_zh"
    t.float    "price"
    t.string   "sku"
    t.integer  "rect_left"
    t.integer  "rect_top"
    t.string   "rect_color"
    t.integer  "api_food_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "api_tasting_flight_items", :force => true do |t|
    t.integer  "image_id"
    t.integer  "api_tasting_flight_id"
    t.string   "name_en"
    t.string   "name_zh"
    t.float    "price"
    t.string   "sku"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.integer  "wine_id"
  end

  create_table "api_water_items", :force => true do |t|
    t.string   "name_en"
    t.string   "name_zh"
    t.float    "price"
    t.string   "sku"
    t.integer  "rect_left"
    t.integer  "rect_top"
    t.string   "rect_color"
    t.integer  "api_water_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "refinery_api_foods", :force => true do |t|
    t.integer  "image_id"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "refinery_api_tasting_flights", :force => true do |t|
    t.float    "price"
    t.string   "sku"
    t.string   "name_en"
    t.string   "name_zh"
    t.integer  "image_id"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "size"
  end

  create_table "refinery_api_waters", :force => true do |t|
    t.integer  "image_id"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "refinery_api_wines", :force => true do |t|
    t.string   "type"
    t.string   "vintage"
    t.string   "name_en"
    t.string   "name_zh"
    t.string   "region"
    t.string   "wine_style"
    t.string   "capacity"
    t.string   "alcoholicity"
    t.string   "variety"
    t.string   "rating"
    t.string   "rating_rp"
    t.string   "rating_ws"
    t.string   "rating_jr"
    t.float    "price"
    t.text     "info"
    t.string   "cellar_num"
    t.string   "cellar_location"
    t.string   "slug"
    t.integer  "image_id"
    t.integer  "position"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "wine_id"
    t.string   "sku"
    t.string   "chateau"
    t.string   "region_zh"
  end

  create_table "refinery_drinks", :force => true do |t|
    t.string   "name_en"
    t.string   "name_zh"
    t.float    "price"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "refinery_foods", :force => true do |t|
    t.string   "name_en"
    t.string   "name_zh"
    t.float    "price"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "refinery_images", :force => true do |t|
    t.string   "image_mime_type"
    t.string   "image_name"
    t.integer  "image_size"
    t.integer  "image_width"
    t.integer  "image_height"
    t.string   "image_uid"
    t.string   "image_ext"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "refinery_page_part_translations", :force => true do |t|
    t.integer  "refinery_page_part_id"
    t.string   "locale"
    t.text     "body"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "refinery_page_part_translations", ["locale"], :name => "index_refinery_page_part_translations_on_locale"
  add_index "refinery_page_part_translations", ["refinery_page_part_id"], :name => "index_f9716c4215584edbca2557e32706a5ae084a15ef"

  create_table "refinery_page_parts", :force => true do |t|
    t.integer  "refinery_page_id"
    t.string   "title"
    t.text     "body"
    t.integer  "position"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "refinery_page_parts", ["id"], :name => "index_refinery_page_parts_on_id"
  add_index "refinery_page_parts", ["refinery_page_id"], :name => "index_refinery_page_parts_on_refinery_page_id"

  create_table "refinery_page_translations", :force => true do |t|
    t.integer  "refinery_page_id"
    t.string   "locale"
    t.string   "title"
    t.string   "custom_slug"
    t.string   "menu_title"
    t.string   "slug"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "refinery_page_translations", ["locale"], :name => "index_refinery_page_translations_on_locale"
  add_index "refinery_page_translations", ["refinery_page_id"], :name => "index_d079468f88bff1c6ea81573a0d019ba8bf5c2902"

  create_table "refinery_pages", :force => true do |t|
    t.integer  "parent_id"
    t.string   "path"
    t.string   "slug"
    t.boolean  "show_in_menu",        :default => true
    t.string   "link_url"
    t.string   "menu_match"
    t.boolean  "deletable",           :default => true
    t.boolean  "draft",               :default => false
    t.boolean  "skip_to_first_child", :default => false
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.string   "view_template"
    t.string   "layout_template"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "refinery_pages", ["depth"], :name => "index_refinery_pages_on_depth"
  add_index "refinery_pages", ["id"], :name => "index_refinery_pages_on_id"
  add_index "refinery_pages", ["lft"], :name => "index_refinery_pages_on_lft"
  add_index "refinery_pages", ["parent_id"], :name => "index_refinery_pages_on_parent_id"
  add_index "refinery_pages", ["rgt"], :name => "index_refinery_pages_on_rgt"

  create_table "refinery_resources", :force => true do |t|
    t.string   "file_mime_type"
    t.string   "file_name"
    t.integer  "file_size"
    t.string   "file_uid"
    t.string   "file_ext"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "refinery_roles", :force => true do |t|
    t.string "title"
  end

  create_table "refinery_roles_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "refinery_roles_users", ["role_id", "user_id"], :name => "index_refinery_roles_users_on_role_id_and_user_id"
  add_index "refinery_roles_users", ["user_id", "role_id"], :name => "index_refinery_roles_users_on_user_id_and_role_id"

  create_table "refinery_user_plugins", :force => true do |t|
    t.integer "user_id"
    t.string  "name"
    t.integer "position"
  end

  add_index "refinery_user_plugins", ["name"], :name => "index_refinery_user_plugins_on_name"
  add_index "refinery_user_plugins", ["user_id", "name"], :name => "index_refinery_user_plugins_on_user_id_and_name", :unique => true

  create_table "refinery_users", :force => true do |t|
    t.string   "username",               :null => false
    t.string   "email",                  :null => false
    t.string   "encrypted_password",     :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "sign_in_count"
    t.datetime "remember_created_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  add_index "refinery_users", ["id"], :name => "index_refinery_users_on_id"

  create_table "refinery_wines", :force => true do |t|
    t.string   "vintage",          :limit => 11
    t.string   "name_en"
    t.string   "name_zh"
    t.string   "region"
    t.integer  "wine_style_id"
    t.string   "capacity",         :limit => 11
    t.string   "alcoholicity",     :limit => 11
    t.string   "variety"
    t.string   "rating",           :limit => 11
    t.string   "rating_rp",        :limit => 11
    t.string   "rating_ws",        :limit => 11
    t.string   "rating_jr",        :limit => 11
    t.float    "price"
    t.text     "info"
    t.string   "cellar_num",       :limit => 11
    t.string   "cellar_location",  :limit => 11
    t.string   "slug"
    t.integer  "position"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "photo_id"
    t.string   "region_zh"
    t.string   "chateau"
    t.string   "cover_image_uid"
    t.string   "cover_image_name"
    t.string   "status"
    t.string   "bar_category"
    t.string   "tags"
    t.float    "trade_price"
    t.float    "act_price"
    t.string   "disc_rate"
    t.string   "wine_list_price"
    t.string   "final_list_price"
    t.string   "source"
    t.text     "description"
    t.string   "remark"
    t.text     "tasting_notes_en"
    t.text     "tasting_notes_cn"
    t.string   "enclosure"
    t.string   "bottle_format"
  end

  create_table "seo_meta", :force => true do |t|
    t.integer  "seo_meta_id"
    t.string   "seo_meta_type"
    t.string   "browser_title"
    t.string   "meta_keywords"
    t.text     "meta_description"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "seo_meta", ["id"], :name => "index_seo_meta_on_id"
  add_index "seo_meta", ["seo_meta_id", "seo_meta_type"], :name => "index_seo_meta_on_seo_meta_id_and_seo_meta_type"

  create_table "wine_styles", :force => true do |t|
    t.string   "name_en",    :limit => 11
    t.string   "name_zh",    :limit => 11
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

end
