class CreateApiFoodItems < ActiveRecord::Migration
  def change
    create_table :api_food_items do |t|
      t.string :name_en
      t.string :name_zh
      t.float :price
      t.string :sku
      t.integer :rect_left
      t.integer :rect_top
      t.string :rect_color
      t.integer :api_food_id

      t.timestamps
    end
  end
end
