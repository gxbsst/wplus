module Refinery
  module ApiWaters
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::ApiWaters

      engine_name :refinery_api_waters

      initializer "register refinerycms_api_waters plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "api_waters"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.api_waters_admin_api_waters_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/api_waters/api_water'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::ApiWaters)
      end
    end
  end
end
