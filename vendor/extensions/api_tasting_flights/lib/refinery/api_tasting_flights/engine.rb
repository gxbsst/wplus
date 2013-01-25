module Refinery
  module ApiTastingFlights
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::ApiTastingFlights

      engine_name :refinery_api_tasting_flights

      initializer "register refinerycms_api_tasting_flights plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "api_tasting_flights"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.api_tasting_flights_admin_api_tasting_flights_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/api_tasting_flights/api_tasting_flight',
            :title => 'sku'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::ApiTastingFlights)
      end
    end
  end
end
