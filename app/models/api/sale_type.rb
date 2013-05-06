#encoding: utf-8
module Api
  class SaleType < ActiveRecord::Base
    include Support
    set_table_name 'api_type'
    self.inheritance_column = nil
    attr_accessible :position, :type, :typename_en, :typename_cn
    
    has_many :wine_sales

    class << self
      def  init
        types = {
          :monthly => ['Monthly Special', '每月精选', 1],
          :membership => ['Membership Priviliege', '会员特惠', 2],
          :glass => ['Wine by Glass', '单杯特卖', 3],
          :tasting_flights => ['Tasting Flights', '系列品鉴', 4],
          :bottle => ['Wine by Bottle', '整瓶特惠', 5],
          :foods => ['Foods', '美食', 6],
          :waters => ['Waters', '饮料', 7],
          :around => ['Walk Around', '随便看看', 8]
        }

        types.each do |key, value|
          find_or_create_by_type_and_typename_en_and_typename_cn(key.to_s, value[0], value[1], :position => value[2])
        end
      end
    end
  end
end
