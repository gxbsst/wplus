# This migration comes from refinery_api_wines (originally 1)
class CreateApiWinesApiWines < ActiveRecord::Migration

  def up
    create_table :refinery_api_wines do |t|
      t.string :type
      t.string :vintage
      t.string :name_en
      t.string :name_zh
      t.string :region
      t.string :wine_style
      t.string :capacity
      t.string :alcoholicity
      t.string :variety
      t.string :rating
      t.string :rating_rp
      t.string :rating_ws
      t.string :rating_jr
      t.float :price
      t.text :info
      t.string :cellar_num
      t.string :cellar_location
      t.string :slug
      t.integer :image_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-api_wines"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/api_wines/api_wines"})
    end

    drop_table :refinery_api_wines

  end

end
