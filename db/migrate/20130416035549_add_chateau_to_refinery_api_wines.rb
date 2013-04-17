class AddChateauToRefineryApiWines < ActiveRecord::Migration
  def change
    add_column :refinery_api_wines, :chateau, :string
    add_column :refinery_api_wines, :region_zh, :string
  end
end
