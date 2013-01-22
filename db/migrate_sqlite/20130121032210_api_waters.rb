class ApiWaters < ActiveRecord::Migration
  def up
    create_table :api_waters do |t|
       t.string :image
       t.timestamps      
    end
  end

  def down
    drop_table :api_waters
  end
end
