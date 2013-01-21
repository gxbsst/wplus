class AddPhotoToRefineryWines < ActiveRecord::Migration
  def change
    add_column :refinery_wines, :photo_id, :integer
  end
end
