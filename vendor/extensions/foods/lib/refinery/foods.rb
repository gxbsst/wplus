require 'refinerycms-core'

module Refinery
  autoload :FoodsGenerator, 'generators/refinery/foods_generator'

  module Foods
    require 'refinery/foods/engine'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end
