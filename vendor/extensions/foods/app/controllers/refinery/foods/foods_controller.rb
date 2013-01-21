module Refinery
  module Foods
    class FoodsController < ::ApplicationController

      before_filter :find_all_foods
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @food in the line below:
        present(@page)
      end

      def show
        @food = Food.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @food in the line below:
        present(@page)
      end

    protected

      def find_all_foods
        @foods = Food.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/foods").first
      end

    end
  end
end
