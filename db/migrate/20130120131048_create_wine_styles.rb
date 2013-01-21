class CreateWineStyles < ActiveRecord::Migration
  def change
    create_table :wine_styles do |t|
      t.string :name_en, :limit => 11
      t.string :name_zh, :limit => 11

      t.timestamps
    end
  end
end
