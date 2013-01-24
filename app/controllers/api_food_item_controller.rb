class ApiFoodItemController < ApplicationController

  # def create
  # 	@food = Refinery::Foods::Food.find(params[:id])
  # 	@api_food_item = ApiFoodItem.new(:name_en => @food.name_en,:name_zh => @food.name_zh, :price => @food.price)

   
  # 	respond_to do |format|
  #     if @api_food_item.save
  #       format.html { redirect_to refinery.edit_api_foods_admin_api_food_path(1), notice: 'api_food_item was successfully created.' }
        
  #     else
  #       format.html { render action: "new" }
       
  #     end
  #   end
  # end

    def destroy
          # binding.pry
          @food_item = ApiFoodItem.find(params[:id])
          @food_item.destroy

          redirect_to refinery.api_foods_admin_api_foods_path
    end

end
