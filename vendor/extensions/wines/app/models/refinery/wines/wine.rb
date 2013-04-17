#encoding: utf-8
module Refinery
  module Wines
    class Wine < Refinery::Core::BaseModel

      image_accessor :cover_image

      extend FriendlyId
      friendly_id :name_en, use: :slugged

      self.table_name = 'refinery_wines'

      attr_accessible :photo_id, :vintage, :name_en, :name_zh, :region, :wine_style_id, 
                      :capacity, :alcoholicity, :variety, :rating, :rating_rp, :rating_ws, 
                      :rating_jr, :price, :info, :cellar_num, :cellar_location, :slug, 
                      :position, :cover_image_uid, :cover_image_name, :cover_image, :cover_image_url
      attr_accessible :photo_id, :vintage, :name_en, :name_zh, :region, :region_zh, :wine_style_id, :capacity, :alcoholicity,
                      :variety, :rating, :rating_rp, :rating_ws, :rating_jr, :price, :info, :cellar_num,
                      :cellar_location, :slug, :position, :chateau

      acts_as_indexed :fields => [:vintage, :name_en, :name_zh, :region, :capacity, :alcoholicity, :variety, :rating, :rating_rp, :rating_ws, :rating_jr, :info, :cellar_num, :cellar_location, :slug]

      validates :vintage, :name_en, :presence => true
      validates :name_en, :uniqueness => {:scope => :vintage}
      belongs_to :photo, :class_name => '::Refinery::Image'
      belongs_to :wine_style

      def style
        "#{wine_style.name_en} #{wine_style.name_zh}"
      end

      def year_and_name_zh
      	"#{vintage} #{name_zh}"
      end

      def year_and_name_en
      	"#{vintage} #{name_en}"
      end

      def price_with_unit
      	"￥ #{price}"
      end

      def wine_position
      	"酒柜 ##{cellar_num}, ##{cellar_location}"
      end
    end
  end
end
