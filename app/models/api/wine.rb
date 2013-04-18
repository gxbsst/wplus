module Api
  class Wine < ActiveRecord::Base
    include Support

    attr_accessible :vintage, :name_en, :name_zh, :region, :chateau, :wine_style, :capacity, :alcoholicity,
    :variety, :rating, :rating_rp, :rating_ws, :rating_jr, :price, :info, :image

    class << self

      # init data from refinery wine
      def init
        #connection.execute('DELETE FROM api_wines IF EXISTS')
        Refinery::Wines::Wine.all.each do |wine|

          create(
            :vintage => wine.vintage || -1,
            :name_en => wine.name_en ,
            :name_zh => wine.name_zh,
            :region => "#{wine.region} #{wine.region_zh}",
            :chateau => wine.chateau || -1,
            :wine_style =>  wine.style,
            :capacity => wine.capacity || -1,
            :alcoholicity => wine.alcoholicity || -1,
            :variety => wine.variety.gsub(/\n/, "") || -1,
            :rating => wine.rating || -1,
            :rating_rp => wine.rating_rp || -1,
            :rating_ws => wine.rating_ws || -1,
            :rating_jr => wine.rating_jr || -1,
            :price => wine.price || -1,
            :info => wine.info,
            :image => wine.photo.try(:image_name) || -1
          )

          # copy image
          copy_image(wine.photo) if wine.photo

        end
      end


    end

  end
end
