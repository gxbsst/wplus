class AddRatingAmToRefineryWines < ActiveRecord::Migration
  def change
    add_column :refinery_wines, :rating_am, :string
  end
end
