module Api
  module Support

    def self.included(klass)
      klass.establish_connection :api
      klass.table_name_prefix = 'api_'
      klass.extend ClassMethod
    end

    module ClassMethod

    end

  end
end
