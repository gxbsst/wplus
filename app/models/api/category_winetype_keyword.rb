module Api
  class CategoryWinetypeKeyword < ActiveRecord::Base
    include Support

    class << self

      # init data from refinery wine
      def init
        WineStyle.all.each do |style|
          find_or_create_by_name_EN_and_name_CN(style.name_en, style.name_zh)
        end
      end

    end

  end
end
