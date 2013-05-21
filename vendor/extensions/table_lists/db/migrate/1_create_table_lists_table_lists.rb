class CreateTableListsTableLists < ActiveRecord::Migration

  def up
    create_table :refinery_table_lists do |t|
      t.integer :categoryid
      t.string :name
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-table_lists"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/table_lists/table_lists"})
    end

    drop_table :refinery_table_lists

  end

end
