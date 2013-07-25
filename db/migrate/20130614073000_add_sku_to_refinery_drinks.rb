class AddSkuToRefineryDrinks < ActiveRecord::Migration
  def change
    add_column :refinery_drinks, :sku, :string
  end
end
