module Refinery
  module ApiTastingFlights
    class ApiTastingFlight < Refinery::Core::BaseModel
      self.table_name = 'refinery_api_tasting_flights'

      attr_accessible :price, :sku, :name_en, :name_zh, :image_id, :position, :api_tasting_flight_items_attributes
 
      acts_as_indexed :fields => [:sku, :name_en, :name_zh]

      validates :name_en, :sku, :presence => true
      validates :sku, :uniqueness => true

      belongs_to :image, :class_name => '::Refinery::Image'

      has_many :api_tasting_flight_items, :dependent => :destroy

      accepts_nested_attributes_for :api_tasting_flight_items, :allow_destroy => true

    end
  end
end
