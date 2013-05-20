class ChangeRefineryWineFieldLenght < ActiveRecord::Migration
  def up
    change_column :refinery_wines, :name_en, :string, :limit => 255
    change_column :refinery_wines, :name_zh, :string, :limit => 255
    change_column :refinery_wines, :slug, :string, :limit => 255
  end

  def down
    change_column :refinery_wines, :name_en, :string, :limit => 11
    change_column :refinery_wines, :name_zh, :string, :limit => 11
    change_column :refinery_wines, :slug, :string, :limit => 11
  end
end
