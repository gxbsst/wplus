class AddRegionZhToRefineryWines < ActiveRecord::Migration
  def change
    add_column :refinery_wines, :region_zh, :string
  end
end
