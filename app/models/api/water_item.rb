module Api
  class WaterItem < ActiveRecord::Base
    include Support
    belongs_to :water, :class_name => 'Api::Water', :foreign_key => :api_water_id

    attr_accessible :name_en, :name_zh, :price, :rect_left, :rect_top, :rect_color, :sku

  end
end