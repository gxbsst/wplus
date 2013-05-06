module Api
  class CategoryRegionKeyword < ActiveRecord::Base
    attr_accessible  :name_en, :name_cn, :parent_id, :level
    include Support

    class << self

      # init data from refinery wine
      def init
        Refinery::Wines::Wine.all.each do |wine|
          temp = [0]
          wine.region.split('>').each do |r|
              # TODO name_an may be not nil
              region = find_or_create_by_parent_id_and_name_en(temp.last, r, :name_cn => -1)
              temp << region.id
          end
        end
      end

    end
  end

end
