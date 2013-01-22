module Refinery
  module ApiWines
    module Admin
      class ApiWinesController < ::Refinery::AdminController

        crudify :'refinery/api_wines/api_wine',
                :title_attribute => 'type', :xhr_paging => true

      end
    end
  end
end
