# This migration comes from refinery_api_tasting_flights (originally 1)
class CreateApiTastingFlightsApiTastingFlights < ActiveRecord::Migration

  def up
    create_table :refinery_api_tasting_flights do |t|
      t.float :price
      t.string :sku
      t.string :name_en
      t.string :name_zh
      t.integer :image_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-api_tasting_flights"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/api_tasting_flights/api_tasting_flights"})
    end

    drop_table :refinery_api_tasting_flights

  end

end
