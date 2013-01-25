require 'refinerycms-core'

module Refinery
  autoload :ApiTastingFlightsGenerator, 'generators/refinery/api_tasting_flights_generator'

  module ApiTastingFlights
    require 'refinery/api_tasting_flights/engine'

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
