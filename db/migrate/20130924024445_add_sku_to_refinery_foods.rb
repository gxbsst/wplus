class AddSkuToRefineryFoods < ActiveRecord::Migration
  def change
    add_column :refinery_foods, :sku, :string
  end
end
