def wine_id(name_en)
  WineStyle.find_by_name_en(name_en).id
end

def init_by_csv(line)
  Refinery::Wines::Wine.new(
      :vintage => line[0],
      :name_en => line[1],
      :name_zh => line[2],
      :region => "#{line[3] + line[4]}",
      :wine_style_id => wine_id(line[5]),
      :capacity => line[6],
      :alcoholicity => line[7],
      :variety => line[8],
      :rating => line[9],
      :rating_rp => line[10],
      :rating_ws => line[11],
      :rating_jr => line[12],
      :price => line[13],
      :info => line[14]
  )
end

require 'csv'
namespace :app do

  desc "init Wines data"
  task :init_wines => :environment do
    CSV.foreach(Rails.root.join('lib', 'tasks', 'wines2.csv')) do |line|
        wine = init_by_csv(line)

        # TODO: UPLOAD IMAGE
        #image_file = File.open('file_name.png')
        #image = wine.create_image(image_file)
        #wine.photo_id = image.id

        wine.save
    end
  end

  desc "Init Api Sale Type"
  task :init_api_sale_type => :environment  do
   Api::Type.init
  end

  desc "Generate API DATABASE"
  task  :init_api_database => :environment do
    # init region
    Api::CategoryRegionKeyword.init
    # init variety
    Api::CategoryVarietyKeyword.init
    # init wine style
    ApiCategoryWinetypeKeyword.init
    # init Wines
    Api::Wine.init
    # init Wine Sale
    Api::WineSale.init

    # init Foods & Food Items
    # init Water & Water Items
    # init Task Flight & Task Flight Items
  end

end
