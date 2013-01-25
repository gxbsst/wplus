class CreateApiTastingFlightItem < ActiveRecord::Migration
  def up
  	create_table :api_tasting_flight_items do |t|
      t.integer :image_id
      t.integer :api_tasting_flight_id 
      t.string :name_en    
      t.string :name_zh
      t.float :price  
      t.string :sku   
      t.timestamps
  	end
  end

  def down
  	drop_table :api_tasting_flight_items
  end
end
