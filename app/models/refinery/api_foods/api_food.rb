module Refinery
  module ApiFoods
    class ApiFood < Refinery::Core::BaseModel
      self.table_name = 'refinery_api_foods'

      attr_accessible :image_id, :position
      # def title was created automatically because you didn't specify a string field
      # when you ran the refinery:engine generator. <3 <3 Refinery CMS.
      def title
        "Override def title in vendor/extensions/api_foods/app/models/refinery/api_foods/api_food.rb"
      end
      belongs_to :image, :class_name => '::Refinery::Image'
      has_many :api_food_items, :dependent => :destroy
    end
  end
end
