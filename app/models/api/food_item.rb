module Api
  class FoodItem < ActiveRecord::Base
    include Support
    belongs_to :food, :class_name => 'Api::Food', :foreign_key => :api_food_id

    attr_accessible :name_en, :name_zh, :price, :rect_left, :rect_top, :rect_color

  end
end