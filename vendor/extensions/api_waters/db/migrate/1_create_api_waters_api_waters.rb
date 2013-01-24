class CreateApiWatersApiWaters < ActiveRecord::Migration

  def up
    create_table :refinery_api_waters do |t|
      t.integer :image_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-api_waters"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/api_waters/api_waters"})
    end

    drop_table :refinery_api_waters

  end

end
