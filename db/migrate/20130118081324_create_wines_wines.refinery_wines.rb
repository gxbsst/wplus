# This migration comes from refinery_wines (originally 1)
class CreateWinesWines < ActiveRecord::Migration

  def up
    create_table :refinery_wines do |t|
      t.string :vintage, :limit => 11
      t.string :name_en, :limit => 11
      t.string :name_zh, :limit => 11
      t.string :region
      t.integer :wine_style_id
      t.string :capacity, :limit => 11
      t.string :alcoholicity, :limit => 11
      t.string :variety
      t.string :rating, :limit => 11
      t.string :rating_rp, :limit => 11
      t.string :rating_ws, :limit => 11
      t.string :rating_jr, :limit => 11
      t.float :price
      t.string :info
      t.string :cellar_num, :limit => 11
      t.string :cellar_location, :limit => 11
      t.string :slug, :limit => 11
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-wines"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/wines/wines"})
    end

    drop_table :refinery_wines

  end

end
