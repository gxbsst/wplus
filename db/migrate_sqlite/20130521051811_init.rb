class  Init < ActiveRecord::Migration
  def up
    create_table "api_category_region_keywords", :force => true do |t|
      t.string  "name_en",   :limit => 200
      t.string  "name_cn",   :limit => 200
      t.integer "parent_id",                :default => 0
      t.integer "level"
    end

    create_table "api_category_variety_keywords", :force => true do |t|
      t.string "name_en", :limit => 200
      t.string "name_cn", :limit => 200
    end

    create_table "api_category_winetype_keywords", :force => true do |t|
      t.string "name_EN", :limit => 200
      t.string "name_CN", :limit => 200
    end

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

    create_table "api_foods", :force => true do |t|
      t.string   "image"
      t.datetime "created_at", :null => false
      t.datetime "updated_at", :null => false
    end

    create_table "api_tablelist", :force => true do |t|
      t.integer "categoryid"
      t.string  "name",       :limit => 100
    end

    create_table "api_tasting_flight_items", :force => true do |t|
      t.integer  "wine_id",                :null => false
      t.integer  "api_tasting_flights_id"
      t.datetime "created_at",             :null => false
      t.datetime "updated_at",             :null => false
    end

    create_table "api_tasting_flights", :force => true do |t|
      t.float    "price"
      t.string   "sku"
      t.string   "name_en"
      t.string   "name_zh"
      t.string   "size"
      t.string   "image"
      t.datetime "created_at", :null => false
      t.datetime "updated_at", :null => false
    end

    create_table "api_type", :force => true do |t|
      t.integer "position"
      t.string  "type",        :limit => 50
      t.string  "typename_en", :limit => 50
      t.string  "typename_cn", :limit => 10
      t.string  "image",       :limit => 100
    end

    create_table "api_user", :force => true do |t|
      t.string "name",     :limit => 200
      t.string "password", :limit => 200
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

    create_table "api_waters", :force => true do |t|
      t.string   "image"
      t.datetime "created_at", :null => false
      t.datetime "updated_at", :null => false
    end

    create_table "api_wine_sales", :force => true do |t|
      t.integer "type"
      t.integer "wineId"
      t.integer "price"
      t.string  "size",   :limit => 10
    end

    create_table "api_wines", :force => true do |t|
      t.string   "vintage"
      t.string   "name_en"
      t.string   "name_zh"
      t.string   "chateau"
      t.string   "region"
      t.string   "wine_style"
      t.string   "capacity"
      t.string   "alcoholicity"
      t.string   "variety"
      t.string   "rating",          :limit => 11
      t.string   "rating_rp",       :limit => 11
      t.string   "rating_ws",       :limit => 11
      t.string   "rating_jr",       :limit => 11
      t.float    "price"
      t.string   "info"
      t.string   "cellar_num",      :limit => 11
      t.string   "cellar_location", :limit => 11
      t.string   "slug",            :limit => 11
      t.string   "image"
      t.datetime "created_at",                    :null => false
      t.datetime "updated_at",                    :null => false
    end
    
  end

  def down
    drop_table :api_category_region_keywords
    drop_table :api_category_variety_keywords
    drop_table :api_category_winetype_keywords
    drop_table :api_food_items
    drop_table :api_foods
    drop_table :api_tablelist
    drop_table :api_tasting_flight_items
    drop_table :api_tasting_flights
    drop_table :api_type
    drop_table :api_user
    drop_table :api_water_items
    drop_table :api_waters
    drop_table :api_wine_sales
    drop_table :api_wines
  end
end
