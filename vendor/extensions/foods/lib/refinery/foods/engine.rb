module Refinery
  module Foods
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Foods

      engine_name :refinery_foods

      initializer "register refinerycms_foods plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "foods"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.foods_admin_foods_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/foods/food',
            :title => 'name_en'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Foods)
      end
    end
  end
end
