class ApiFoodItem < ActiveRecord::Base
  validates :sku, :presence => true, :uniqueness => true
  attr_accessible :name_en, :name_zh, :price, :api_food_id, :sku, :rect_left, :rect_top, :rect_color
  belongs_to :api_food, :class_name => '::Refinery::ApiFood'

end
