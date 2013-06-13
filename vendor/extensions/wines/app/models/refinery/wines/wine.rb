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
                      :position, :cover_image_uid, :cover_image_name, :cover_image, :cover_image_url, :chateau, 
                      :status, :bar_category, :tags, :trade_price, :act_price, :disc_rate,
                      :wine_list_price, :final_list_price, :source, :description, :remark,
                      :tasting_notes_en, :tasting_notes_cn, :enclosure, :bottle_format, :sku, :rating_am

      acts_as_indexed :fields => [:vintage, :name_en, :name_zh, :region, :capacity, :alcoholicity, :variety, :rating, :rating_rp, :rating_ws, :rating_jr, :info, :cellar_num, :cellar_location, :slug]

      validates :name_en, :presence => true
      # validates :name_en, :uniqueness => {:scope => :vintage}

      belongs_to :photo, :class_name => '::Refinery::Image'
      belongs_to :wine_style

      def style
        "#{wine_style.try(:name_en)} #{wine_style.try(:name_zh)}"
      end

      def style_name
        wine_style.try(:name_en)
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

      def create_image(image) # image is File.open(image file)
         Refinery::Image.create(image: image)
      end

      def name
       "#{vintage} #{name_en}"
      end

      def category
        # put to Sparkling Vintage if have vintage
        sparklings = ['Sparkling Red', 'Sparkling', 'Sparkling Rosé', 'Sparkling Vintage']
        # 地区或者不是sparklings的分类加入其他
        return 'Other' if region.blank? && (sparklings.include? wine_style.try(:name_en))
        return 'Sparkling' if (wine_style.try(:name_en) == 'Sparkling Red') && (vintage == 'NV')
        if sparklings.include? wine_style.try(:name_en)
          vintage != 'NV' ? 'Sparkling Vintage': wine_style.try(:name_en) 
        else
          "#{region.split(">").try(:first).try(:strip)} #{wine_style.try(:name_en)}"
        end
      end

      def parent_cat
       (style_name.include? 'Sparkling') ? 'Sparkling' : style_name
      end


    end
  end
end
