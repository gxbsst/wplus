module Api
  class TastingFlightItem < ActiveRecord::Base
    include Support
    belongs_to :wine
    belongs_to :tasting_flight, :class_name => 'Api::TastingFlight', :foreign_key => :api_tasting_flights_id
    attr_accessible :wine_id, :api_tasting_flight_id
  end
end