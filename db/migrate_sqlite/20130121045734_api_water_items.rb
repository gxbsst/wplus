class ApiWaterItems < ActiveRecord::Migration
  def up
    create_table :api_water_items do |t|
      t.string :name_en     
      t.string :name_zh
      t.float :price  
      t.string :sku  
      t.integer :rect_left
      t.integer :rect_top
      t.string :rect_color   
      t.integer :api_water_id
      t.timestamps                           
    end
  end

  def down
    drop_table :api_water_items
  end
end
