module Refinery
  module ApiFoods
    module Admin
      class ApiFoodsController < ::Refinery::AdminController

        def index
          @api_food = Refinery::ApiFoods::ApiFood.last
          @api_food_items = @api_food.api_food_items
        end

        def build_food_item
          render :text => "hello world"
        end


        def new
          @foods = Refinery::Foods::Food.find(params[:id])
          @api_food = Refinery::ApiFoods::ApiFood.create
            @foods.each do |food|
             @api_food_item = ApiFoodItem.new(:name_en => food.name_en,:name_zh => food.name_zh, :price => food.price, :api_food_id => @api_food.id)
             @api_food_item.save
            end
        end


        def update
          
          @api_food = Refinery::ApiFoods::ApiFood.find(params[:id])
          @api_food.update_attributes(:image_id => params[:api_food][:image_id])


          @foods = @api_food.api_food_items

           @foods.each do |food|
             @api_food_item = food.update_attributes(:price => food.price, 
                                                            :sku => params[:sku],
                                                            :rect_left => params[:rect_left], 
                                                            :rect_top => params[:rect_top], 
                                                            :rect_color => params[:rect_color])
           end

           redirect_to refinery.api_foods_admin_api_foods_path
        end


      end
    end
  end
end
