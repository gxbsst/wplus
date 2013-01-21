module Refinery
  module Foods
    class Food < Refinery::Core::BaseModel
      self.table_name = 'refinery_foods'

      attr_accessible :name_en, :name_zh, :price, :position

      acts_as_indexed :fields => [:name_en, :name_zh]

      validates :name_en,:name_zh, :presence => true, :uniqueness => true

      validates :price, :presence => true
    end
  end
end
