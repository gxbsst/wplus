#encoding: utf-8
module Refinery
  module ApiTastingFlights
    module Admin
      class ApiTastingFlightsController < ::Refinery::AdminController

        crudify :'refinery/api_tasting_flights/api_tasting_flight',
                :title_attribute => 'sku', :xhr_paging => true

        def index
        	@api_tasting_flights = Refinery::ApiTastingFlights::ApiTastingFlight.order('id desc')
        	@api_tasting_flights = @api_tasting_flights.where("name_en like ? or name_zh like ?", 
                                      "%#{params[:search]}%", "%#{params[:search]}%") if params[:search]
          page = params[:page] || 1
          @api_tasting_flights = @api_tasting_flights.paginate(:page => page, :per_page => 20)
        	
        end

        def new
        	wines = Refinery::Wines::Wine.find(params[:wine][:ids])
        	@api_tasting_flight = Refinery::ApiTastingFlights::ApiTastingFlight.new(:sku => SecureRandom.uuid)
        	#初始化 items
        	@api_tasting_flight_items = []
        	wines.each do |wine|
        		item = @api_tasting_flight.api_tasting_flight_items.where(:name_en => wine.name_en).
        												first_or_initialize(:name_zh => wine.name_zh,
        																						:image_id => wine.photo_id)
        		@api_tasting_flight_items << item
        	end
        end

        def create
        	@api_tasting_flight = Refinery::ApiTastingFlights::ApiTastingFlight.new(params[:api_tasting_flight])
        	if @api_tasting_flight.save
        		flash[:notice] = "创建成功"
        		redirect_to refinery.api_tasting_flights_admin_api_tasting_flights_path
        	else
        		render :new
        	end
        end

      end
    end
  end
end
