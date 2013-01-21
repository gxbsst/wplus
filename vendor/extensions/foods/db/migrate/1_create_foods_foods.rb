class CreateFoodsFoods < ActiveRecord::Migration

  def up
    create_table :refinery_foods do |t|
      t.string :name_en
      t.string :name_zh
      t.float :price
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-foods"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/foods/foods"})
    end

    drop_table :refinery_foods

  end

end
