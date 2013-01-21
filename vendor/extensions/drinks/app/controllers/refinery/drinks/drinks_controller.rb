module Refinery
  module Drinks
    class DrinksController < ::ApplicationController

      before_filter :find_all_drinks
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @drink in the line below:
        present(@page)
      end

      def show
        @drink = Drink.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @drink in the line below:
        present(@page)
      end

    protected

      def find_all_drinks
        @drinks = Drink.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/drinks").first
      end

    end
  end
end
