module Api
  class TastingFlight < ActiveRecord::Base
    include Support
    has_many :tasting_flight_items, :class_name => 'Api::TastingFlightItem', :foreign_key => 'api_tasting_flights_id'
    attr_accessible :price, :name_en, :name_zh, :size, :image

    class << self
      def init
        Refinery::ApiTastingFlights::ApiTastingFlight.all.each do |item|
          tasting_flight = find_or_create_by_name_en(item.name_en, :name_zh => item.name_zh, :price => item.price, :size => item.size)
          item.api_tasting_flight_items.each do |fi|
            wine_id = ::Api::Wine.find_by_vintage_and_name_en(fi.wine.vintage, fi.wine.name_en).try(:id)
            tf_item = tasting_flight.tasting_flight_items.build(:wine_id => wine_id)
            tf_item.save
          end
        end
      end
    end

  end
end