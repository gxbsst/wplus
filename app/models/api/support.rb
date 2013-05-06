module Api
  module Support

    def self.included(klass)
      klass.establish_connection :api
      klass.table_name_prefix = 'api_'
      klass.extend ClassMethod
    end

    module ClassMethod
      def copy_image(image)
        src_pre_path = 'public/system/refinery/images'
        dest_path = Rails.root.join('db', 'images')
        FileUtils.cp(Rails.root.join(src_pre_path,image.image_uid), "#{dest_path}/#{image.image_name}")
      end
    end

  end
end
