module Refinery
  module Drinks
    class Drink < Refinery::Core::BaseModel
      self.table_name = 'refinery_drinks'

      attr_accessible :name_en, :name_zh, :price, :position, :sku

      acts_as_indexed :fields => [:name_en, :name_zh]

      validates :name_en,:name_zh, :presence => true, :uniqueness => true

      validates :price, :presence => true
    end
  end
end
