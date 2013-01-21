module Refinery
  module Drinks
    module Admin
      class DrinksController < ::Refinery::AdminController

        crudify :'refinery/drinks/drink',
                :title_attribute => 'name_en', :xhr_paging => true

      end
    end
  end
end
