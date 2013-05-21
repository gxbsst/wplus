module Refinery
  module TableLists
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::TableLists

      engine_name :refinery_table_lists

      initializer "register refinerycms_table_lists plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "table_lists"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.table_lists_admin_table_lists_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/table_lists/table_list',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::TableLists)
      end
    end
  end
end
