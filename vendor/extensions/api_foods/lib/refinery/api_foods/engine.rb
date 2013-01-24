module Refinery
  module ApiFoods
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::ApiFoods

      engine_name :refinery_api_foods

      initializer "register refinerycms_api_foods plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "api_foods"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.api_foods_admin_api_foods_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/api_foods/api_food'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::ApiFoods)
      end
    end
  end
end
