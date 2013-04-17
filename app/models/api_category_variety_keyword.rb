class ApiCategoryVarietyKeyword < ActiveRecord::Base
  establish_connection :api

  class << self

    # init data from refinery wine
    def init
      Refinery::Wines::Wine.all.each do |wine|
        #wine.variety.gsub(/\n/, '').split(",").each do |variety| 
        wine.variety.gsub(/\d+\%/, "").split("\n").each do |variety|
          find_or_create_by_name_en(variety)
        end
      end
    end

  end

end
