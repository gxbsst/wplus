class AddStatusToRefineryWines < ActiveRecord::Migration
  def change
    add_column :refinery_wines, :status, :string
    add_column :refinery_wines, :bar_category, :string
    add_column :refinery_wines, :tags, :string
    add_column :refinery_wines, :trade_price, :float
    add_column :refinery_wines, :act_price, :float
    add_column :refinery_wines, :disc_rate, :string
    add_column :refinery_wines, :wine_list_price, :string
    add_column :refinery_wines, :final_list_price, :string
    add_column :refinery_wines, :source, :string
    add_column :refinery_wines, :description, :text
    add_column :refinery_wines, :remark, :string
    add_column :refinery_wines, :tasting_notes_en, :text
    add_column :refinery_wines, :tasting_notes_cn, :text
    add_column :refinery_wines, :enclosure, :string
    add_column :refinery_wines, :bottle_format, :string
  end
end
