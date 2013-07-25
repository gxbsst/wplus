module Api
  class CategoryRegionKeyword < ActiveRecord::Base
    attr_accessible  :name_en, :name_cn, :parent_id, :level
    include Support

    class << self

      # init data from refinery wine
      def init
        Refinery::Wines::Wine.all.each do |wine|
          temp = [0]
          wine.region.split('>')[0,2].each_with_index do |r,i|
            # TODO name_cn may be not nil
            region = find_or_create_by_parent_id_and_name_en(temp.last, r.strip, :name_cn => -1, :level => i)
            temp << region.id
          end
        end
      end

    end
  end

end
