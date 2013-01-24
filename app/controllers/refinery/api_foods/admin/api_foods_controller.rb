module Refinery
  module ApiFoods
    module Admin
      class ApiFoodsController < ::Refinery::AdminController

        def index
          @api_food = Refinery::ApiFoods::ApiFood.last
          @api_food_items = @api_food.api_food_items
        end

        def build_food_item
          @foods = Refinery::Foods::Food.find(params[:id])
          @api_food = Refinery::ApiFoods::ApiFood.create
            @foods.each do |food|
             @api_food_item = ApiFoodItem.new(:name_en => food.name_en,:name_zh => food.name_zh, :price => food.price, :api_food_id => @api_food.id)
             @api_food_item.save
            end
        end
        

        def edit
          @api_food = Refinery::ApiFoods::ApiFood.find(params[:id])
          @foods = @api_food.api_food_items
        end

        def update

          @api_food = Refinery::ApiFoods::ApiFood.find(params[:id])
          @api_food.update_attributes(:image_id => params[:api_food][:image_id])


          @foods = @api_food.api_food_items
           @foods.each_with_index do |food,index|
             @api_food_item = food.update_attributes(:price => params[:price][index], 
                                                            :sku => params[:sku][index],
                                                            :rect_left => params[:rect_left][index], 
                                                            :rect_top => params[:rect_top][index], 
                                                            :rect_color => params[:rect_color][index])
           end

           redirect_to refinery.api_foods_admin_api_foods_path
        end
        
        def destroy
          @api_food = Refinery::ApiFoods::ApiFood.find(params[:id])
          @api_food.destroy

          redirect_to refinery.foods_admin_foods_path
        end

      end
    end
  end
end
