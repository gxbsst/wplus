module Refinery
	module ApiTastingFlights
		class ApiTastingFlightItem < Refinery::Core::BaseModel
			self.table_name = 'api_tasting_flight_items'

			attr_accessible :name_en, :name_zh, :image_id, :sku, :api_tasting_flight_id, :price, :wine_id
			acts_as_indexed :fields => [:api_tasting_flight_id, :name_zh, :name_en]
			validates :name_en, :presence => true
			validates :sku, :uniqueness => true
			belongs_to :image, :class_name => "::Refinery::Image"

			belongs_to :api_tasting_flight
      belongs_to :wine, :class_name => 'Refinery::Wines::Wine', :foreign_key => "wine_id"

			before_save :build_sku

			def build_sku
				self.sku = SecureRandom.uuid
			end
		end
	end

end