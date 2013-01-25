module Refinery
  module ApiTastingFlights
    class ApiTastingFlightsController < ::ApplicationController

      before_filter :find_all_api_tasting_flights
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @api_tasting_flight in the line below:
        present(@page)
      end

      def show
        @api_tasting_flight = ApiTastingFlight.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @api_tasting_flight in the line below:
        present(@page)
      end

    protected

      def find_all_api_tasting_flights
        @api_tasting_flights = ApiTastingFlight.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/api_tasting_flights").first
      end

    end
  end
end
