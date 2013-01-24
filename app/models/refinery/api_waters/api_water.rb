module Refinery
  module ApiWaters
    class ApiWater < Refinery::Core::BaseModel
      self.table_name = 'refinery_api_waters'

      attr_accessible :image_id, :position
      # def title was created automatically because you didn't specify a string field
      # when you ran the refinery:engine generator. <3 <3 Refinery CMS.
      def title
        "Override def title in vendor/extensions/api_waters/app/models/refinery/api_waters/api_water.rb"
      end
      belongs_to :image, :class_name => '::Refinery::Image'
      has_many :api_water_items, :dependent => :destroy
    end
  end
end
