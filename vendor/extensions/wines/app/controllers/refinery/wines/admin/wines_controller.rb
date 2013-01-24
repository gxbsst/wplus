# encoding: utf-8
module Refinery
  module Wines
    module Admin
      class WinesController < ::Refinery::AdminController

        crudify :'refinery/wines/wine',
                :title_attribute => 'vintage', :xhr_paging => true
                
      end
    end
  end
end
