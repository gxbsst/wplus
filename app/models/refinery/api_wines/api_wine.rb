#encoding: utf-8
module Refinery
  module ApiWines
    class ApiWine < Refinery::Core::BaseModel
      extend FriendlyId
      friendly_id :name_en, use: :slugged
      self.table_name = 'refinery_api_wines'
      
      belongs_to :image, :class_name => '::Refinery::Image'

      attr_accessible :type, :vintage, :name_en, :name_zh, :region, :region_zh, :wine_style, :capacity, :alcoholicity, :variety,
                      :rating, :rating_rp, :rating_ws, :rating_jr, :price, :info, :cellar_num, :cellar_location, :slug, :image_id,
                      :position, :wine_id, :sku,:chateau

      acts_as_indexed :fields => [:type, :vintage, :name_en, :name_zh, :region, :wine_style, :capacity, :alcoholicity, :variety, :rating, :rating_rp, :rating_ws, :rating_jr, :info, :cellar_num, :cellar_location, :slug]

      validates :type, :price, :name_en, :presence => true
      # validates :sku, :uniqueness => true
      before_validation :set_price_default

      def set_price_default
        self.price = 0 if self.price.blank?
      end

      scope :membership_discount, where(:type => "Refinery::ApiWines::MembershipDiscount")
      scope :month_special, where(:type => "Refinery::ApiWines::MonthSpecial")
      scope :random_wine, where(:type => "Refinery::ApiWines::RandomWine")
      scope :simple_cup_discount, where(:type => "Refinery::ApiWines::SimpleCupDiscount")
      scope :wine_by_bottle, where(:type => "Refinery::ApiWines::WineByBottle")

      # by_btl 整瓶特卖, by_monthly 为 每月特卖， by_glass 单杯特卖
      WINE_SALE_TYPE = {"by_btl" => Refinery::ApiWines::WineByBottle ,
                        "by_monthly promotion" => Refinery::ApiWines::MonthSpecial, 
                        "by_glass" => Refinery::ApiWines::SimpleCupDiscount }

      def self.init_data
       Refinery::Wines::Wine.all.each do |wine|
        api_wine = new.init(wine)
        api_wine.type = WINE_SALE_TYPE[wine.bar_category].to_s
        api_wine.save!
       end
      end

      def init(wine)
      	self.vintage = wine.vintage || -1
      	self.name_en = wine.name_en
      	self.name_zh = wine.name_zh
      	self.region = wine.region
      	self.wine_style = wine.wine_style.name
      	self.capacity = wine.capacity
      	self.alcoholicity = wine.alcoholicity
      	self.variety = wine.variety
      	self.rating = wine.rating
      	self.rating_jr  = wine.rating_jr
      	self.rating_ws = wine.rating_ws
      	self.rating_rp = wine.rating_rp
      	self.info = wine.info
      	self.price = wine.price
      	self.cellar_num = wine.cellar_num
      	self.cellar_location = wine.cellar_location
      	self.image_id = wine.photo_id
      	self.wine_id = wine.id
        self.sku = wine.sku
        self
      end
      
      #将子类对象变成父类对象，可以定义在子类里面。
      def get_parent
        becomes Refinery::ApiWines::ApiWine
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

      def api_wine_position
        "酒柜 ##{cellar_num}, ##{cellar_location}"
      end

      def api_wine_type
        API_WINE_TYPE['api_wine']["#{self.class.name.underscore.split('/').last}"]
      end

    end
    class MonthSpecial < ApiWine; end
    class MembershipDiscount < ApiWine; end
    class RandomWine < ApiWine;end 
    class SimpleCupDiscount < ApiWine;end

  end
end
