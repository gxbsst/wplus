# encoding: utf-8
module Api
  class CategoryVarietyKeyword < ActiveRecord::Base
    include Support

    class << self

      # init data from refinery wine
      def init
        Refinery::Wines::Wine.all.each do |wine|
          #wine.variety.gsub(/\n/, '').split(",").each do |variety| 
          if wine.variety?
            wine.variety.gsub(/(\d(.+)?(\%|％))|,|\//, "").split("\n").each do |variety|
              find_or_create_by_name_en(strip_and_multi_capitalize(variety))
            end
          end
        end
      end

      def strip_and_multi_capitalize(name_en)
        new_name_en = name_en.strip.delete("/") 
        if new_name_en.present?
          new_name_en.split(/(\W)/).map(&:capitalize).join
        end
      end

    end

  end
end
