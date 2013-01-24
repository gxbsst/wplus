class ApiFoods < ActiveRecord::Migration
  def up
    create_table :api_foods do |t|
      t.integer :food_id
      t.string :image
      t.timestamps      
    end
  end

  def down
    drop_table :api_foods
  end
end
