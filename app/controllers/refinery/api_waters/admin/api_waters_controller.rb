# encoding: UTF-8
module Refinery
  module ApiWaters
    module Admin
      class ApiWatersController < ::Refinery::AdminController

      	def index
          @api_waters = Refinery::ApiWaters::ApiWater.order('position ASC, created_at DESC')
        end

        def build_water_item
          @drinks = Refinery::Drinks::Drink.find(params[:id])
          @api_water = Refinery::ApiWaters::ApiWater.create

            @drinks.each do |drink|
             @api_water_item = ApiWaterItem.new(:name_en => drink.name_en,:name_zh => drink.name_zh, :price => drink.price, :api_water_id => @api_water.id)
             @api_water_item.save
            end
        end

        def update
          @api_water = Refinery::ApiWaters::ApiWater.find(params[:id])
          @api_water.update_attributes(:image_id => params[:api_water][:image_id])


          @drinks = @api_water.api_water_items

           @drinks.each_with_index do |drink,index|
             @api_water_item = drink.update_attributes(:price => params[:price][index], 
                                                            :sku => params[:sku][index],
                                                            :rect_left => params[:rect_left][index], 
                                                            :rect_top => params[:rect_top][index], 
                                                            :rect_color => params[:rect_color][index])
           end

           redirect_to refinery.api_waters_admin_api_waters_path
        	 flash[:notice] = "编辑成功"
        end

        def edit
          @api_water = Refinery::ApiWaters::ApiWater.find(params[:id])
          @drinks = @api_water.api_water_items
        end

        def destroy
          @api_water = Refinery::ApiWaters::ApiWater.find(params[:id])
          @api_water.destroy
          
          flash[:notice] = "删除成功"
          redirect_to refinery.drinks_admin_drinks_path
        end

      end
    end
  end
end
