#encoding: utf-8
module Api
  class SaleType < ActiveRecord::Base
    include Support
    set_table_name 'api_type'
    self.inheritance_column = nil
    has_many :wine_sales

    class << self
      def  init
        types = {
          :monthly => ['Monthly Special', '每月精选'],
          :membership => ['Membership Priviliege', '会员特惠'],
          :glass => ['Wine by Glass', '单杯特卖'],
          :tasting_flights => ['Tasting Flights', '系列品鉴'],
          :bottle => ['Wine by Bottle', '整瓶特惠'],
          :foods => ['Foods', '美食'],
          :waters => ['Waters', '饮料'],
          :around => ['Walk Around', '随便看看']
        }

        types.each do |key, value|
          find_or_create_by_type_and_typename_en_and_typename_cn(key.to_s, value[0], value[1])
        end
      end
    end
  end
end
