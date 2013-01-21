module Refinery
  module Foods
    module Admin
      class FoodsController < ::Refinery::AdminController

        crudify :'refinery/foods/food',
                :title_attribute => 'name_en', :xhr_paging => true

      end
    end
  end
end
