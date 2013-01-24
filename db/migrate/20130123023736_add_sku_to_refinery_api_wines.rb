class AddSkuToRefineryApiWines < ActiveRecord::Migration
  def change
    add_column :refinery_api_wines, :sku, :string
  end
end
