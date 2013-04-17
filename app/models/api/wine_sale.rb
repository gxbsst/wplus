# encoding: utf-8
module Api
  class WineSale < ActiveRecord::Base
    include Support
    self.inheritance_column = nil
    belongs_to :wine, :foreign_key => 'wineId'
    belongs_to :sale_type, :foreign_key => 'type'

    attr_accessible :type, :wineId, :price, :size

    validates :wineId, :type, :price, :size, :presence => true

    class << self

      TYPES = [
          #每月精选
          {:class_name => 'MonthSpecial', :type_text => :monthly, :unit => '瓶'},
          # 随便看看
          {:class_name => 'RandomWine', :type_text => :around, :unit => '瓶'},
          # 整瓶特惠
          {:class_name => 'WineByBottle', :type_text => :bottle, :unit => '瓶'},
          # 单杯特卖
          {:class_name => 'SimpleCupDiscount', :type_text => :glass, :unit => '杯'},
          # 会员特惠
          {:class_name => 'MembershipDiscount', :type_text => :membership, :unit => '瓶'}
      ]

      def init
        TYPES.each do |i|
          migrate_wine(i[:class_name], get_sale_type_id(i[:type_text]), i[:unit])
        end
      end

      def get_sale_type_id(type)
        ::Api::SaleType.find_by_type(type.to_s).id
      end

      def migrate_wine(class_name, sale_type_id, unit)
        eval("Refinery::ApiWines::#{class_name}").all.each do |item|
          find_or_create_by_type_and_wineId_and_price(sale_type_id, get_wine_id(item), item.price, :size => unit)
        end
      end

      def get_wine_id(item)
        ::Api::Wine.find_by_vintage_and_name_en(item.vintage, item.name_en).try(:id)
      end

    end

  end
end
