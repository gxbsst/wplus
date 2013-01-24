class AddWineIdToRefineryApiWines < ActiveRecord::Migration
  def change
    add_column :refinery_api_wines, :wine_id, :integer
  end
end
