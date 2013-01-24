module Refinery
  module ApiWaters
    class ApiWatersController < ::ApplicationController

      before_filter :find_all_api_waters
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @api_water in the line below:
        present(@page)
      end

      def show
        @api_water = ApiWater.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @api_water in the line below:
        present(@page)
      end

    protected

      def find_all_api_waters
        @api_waters = ApiWater.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/api_waters").first
      end

    end
  end
end
