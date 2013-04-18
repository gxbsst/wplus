module Api
  class Food < ActiveRecord::Base
    include Support
    has_many :food_items, :class_name => 'Api::FoodItem', :foreign_key => :api_food_id, :dependent => :destroy

    attr_accessible :image

    validates :image, :presence => true

    class << self
      def init
        Refinery::ApiFoods::ApiFood.all.each do |item|
          food = find_or_create_by_image(item.image.image_name)
          item.api_food_items.each do |fi|
            food_item = food.food_items.build(
                :name_en => fi.name_en || -1,
                :name_zh => fi.name_zh || -1,
                :price => fi.price ,
                :rect_left => fi.rect_left,
                :rect_top => fi.rect_top,
                :rect_color => fi.rect_color
            )
            food_item.save
          end
        end
      end
    end

  end
end