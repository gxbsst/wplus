module Refinery
  module Drinks
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Drinks

      engine_name :refinery_drinks

      initializer "register refinerycms_drinks plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "drinks"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.drinks_admin_drinks_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/drinks/drink',
            :title => 'name_en'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Drinks)
      end
    end
  end
end
