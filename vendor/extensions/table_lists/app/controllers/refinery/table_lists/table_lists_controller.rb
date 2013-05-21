module Refinery
  module TableLists
    class TableListsController < ::ApplicationController

      before_filter :find_all_table_lists
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @table_list in the line below:
        present(@page)
      end

      def show
        @table_list = TableList.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @table_list in the line below:
        present(@page)
      end

    protected

      def find_all_table_lists
        @table_lists = TableList.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/table_lists").first
      end

    end
  end
end
