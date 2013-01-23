module Refinery
  module ApiFoods
    class ApiFoodsController < ::ApplicationController

      before_filter :find_all_api_foods
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @api_food in the line below:
        present(@page)
      end

      def show
        @api_food = ApiFood.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @api_food in the line below:
        present(@page)
      end

    protected

      def find_all_api_foods
        @api_foods = ApiFood.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/api_foods").first
      end

    end
  end
end
