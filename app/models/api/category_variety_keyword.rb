module Api
  class CategoryVarietyKeyword < ActiveRecord::Base
    include Support

    class << self

      # init data from refinery wine
      def init
        Refinery::Wines::Wine.all.each do |wine|
          #wine.variety.gsub(/\n/, '').split(",").each do |variety| 
          if wine.variety?
            wine.variety.gsub(/\d+\%/, "").split("\n").each do |variety|
              find_or_create_by_name_en(variety.strip.delete("/"))
            end
          end
        end
      end

    end

  end
end
