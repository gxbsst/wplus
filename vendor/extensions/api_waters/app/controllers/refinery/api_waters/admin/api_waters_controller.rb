module Refinery
  module ApiWaters
    module Admin
      class ApiWatersController < ::Refinery::AdminController

        crudify :'refinery/api_waters/api_water', :xhr_paging => true

      end
    end
  end
end
