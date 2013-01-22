module Refinery
  module ApiWines
    class ApiWinesController < ::ApplicationController

      before_filter :find_all_api_wines
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @api_wine in the line below:
        present(@page)
      end

      def show
        @api_wine = ApiWine.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @api_wine in the line below:
        present(@page)
      end

    protected

      def find_all_api_wines
        @api_wines = ApiWine.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/api_wines").first
      end

    end
  end
end
