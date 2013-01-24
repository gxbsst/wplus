class ApiTastingFlights < ActiveRecord::Migration
  def up
    create_table :api_tasting_flights do |t|
      t.float  :price
      t.string :sku
      t.string :name_en
      t.string :name_zh
      t.string :image   
      t.timestamps
    end
  end

  def down
    drop_table :api_tasting_flights
  end
end
