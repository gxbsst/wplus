class AddChateauToRefineryWines < ActiveRecord::Migration
  def change
    add_column :refinery_wines, :chateau, :string
  end
end
