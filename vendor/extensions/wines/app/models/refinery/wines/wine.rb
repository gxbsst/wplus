module Refinery
  module Wines
    class Wine < Refinery::Core::BaseModel
      self.table_name = 'refinery_wines'

      attr_accessible :vintage, :name_en, :name_zh, :region, :wine_style_id, :capacity, :alcoholicity, :variety, :rating, :rating_rp, :rating_ws, :rating_jr, :price, :info, :cellar_num, :cellar_location, :slug, :position

      acts_as_indexed :fields => [:vintage, :name_en, :name_zh, :region, :capacity, :alcoholicity, :variety, :rating, :rating_rp, :rating_ws, :rating_jr, :info, :cellar_num, :cellar_location, :slug]

      validates :vintage, :presence => true, :uniqueness => true
    end
  end
end
