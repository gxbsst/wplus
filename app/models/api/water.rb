module Api
  class Water < ActiveRecord::Base

    include Support
    has_many :water_items, :class_name => 'Api::WaterItem', :foreign_key => :api_water_id

    attr_accessible :image

    validates :image, :presence => true

    class << self

      def init

        Refinery::ApiWaters::ApiWater.all.each do |item|
          water = find_or_create_by_image(item.image.try(:image_name))

          #copy image
          copy_image(item.image) if item.image

          item.api_water_items.each do |fi|
            water_item = water.water_items.build(
                :name_en => fi.name_en || -1,
                :name_zh => fi.name_zh || -1,
                :price => fi.price,
                :rect_left => fi.rect_left,
                :rect_top => fi.rect_top,
                :rect_color => fi.rect_color
            )
            water_item.save
          end
        end

      end

    end

  end

end