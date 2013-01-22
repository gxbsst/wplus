module Refinery
  module ApiWines
    class ApiWine < Refinery::Core::BaseModel
      self.table_name = 'refinery_api_wines'
      
      belongs_to :image, :class_name => '::Refinery::Image'

      attr_accessible :type, :vintage, :name_en, :name_zh, :region, :wine_style, :capacity, :alcoholicity, :variety, :rating, :rating_rp, :rating_ws, :rating_jr, :price, :info, :cellar_num, :cellar_location, :slug, :image_id, :position

      acts_as_indexed :fields => [:type, :vintage, :name_en, :name_zh, :region, :wine_style, :capacity, :alcoholicity, :variety, :rating, :rating_rp, :rating_ws, :rating_jr, :info, :cellar_num, :cellar_location, :slug]

      validates :type, :presence => true, :uniqueness => true
    end
  end
end
