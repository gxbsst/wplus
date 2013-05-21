module Refinery
  module TableLists
    module Admin
      class TableListsController < ::Refinery::AdminController

        crudify :'refinery/table_lists/table_list',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
