class ApiWaterItem < ActiveRecord::Base
  
  attr_accessible :api_water_id, :name_en, :name_zh, :price, :rect_color, :rect_left, :rect_top, :sku
  belongs_to :api_water, :class_name => '::Refinery::ApiWater'
end
