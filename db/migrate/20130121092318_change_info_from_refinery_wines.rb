class ChangeInfoFromRefineryWines < ActiveRecord::Migration
  def change
  	change_column :refinery_wines, :info, :text
  end
end
