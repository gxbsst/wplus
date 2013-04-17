class AddImageToRefineryWines < ActiveRecord::Migration
  def change
    add_column :refinery_wines, :cover_image_uid, :string
    add_column :refinery_wines, :cover_image_name, :string
  end
end
