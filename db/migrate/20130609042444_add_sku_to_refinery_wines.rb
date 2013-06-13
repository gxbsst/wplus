class AddSkuToRefineryWines < ActiveRecord::Migration
  def change
    add_column :refinery_wines, :sku, :string
  end
end
