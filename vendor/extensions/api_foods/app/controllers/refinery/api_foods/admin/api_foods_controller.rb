module Refinery
  module ApiFoods
    module Admin
      class ApiFoodsController < ::Refinery::AdminController

        crudify :'refinery/api_foods/api_food', :xhr_paging => true

      end
    end
  end
end
