module Api
  class CategoryRegionKeyword < ActiveRecord::Base
    include Support

    class << self

      # init data from refinery wine
      def init
        Refinery::Wines::Wine.all.each do |wine|
          temp = [0]
          wine.region.split('>').each do |r|
            region = find_or_create_by_parent_id_and_name_en(temp.last, r)
            temp << region.id
          end
        end
      end

    end
  end

end
