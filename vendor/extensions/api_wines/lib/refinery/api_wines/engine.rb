module Refinery
  module ApiWines
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::ApiWines

      engine_name :refinery_api_wines

      initializer "register refinerycms_api_wines plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "api_wines"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.api_wines_admin_api_wines_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/api_wines/api_wine',
            :title => 'type'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::ApiWines)
      end
    end
  end
end
