def wine_id(name_en)
  name_en ||= 'Others'
  WineStyle.find_by_name_en(name_en).try(:id)
end

def parse_region(line)
 [line[6], line[7], line[8], line[9]].compact.join(' > ')
end

def init_by_csv(line)
  Refinery::Wines::Wine.new(
      :status => line[0],
      :bar_category => line[1],
      :vintage => line[2],
      :name_en => line[3],
      :name_zh => line[4],
      :chateau => line[5],
      :region => parse_region(line),
      :tags => line[10],
      :wine_style_id => wine_id(line[11]),
      :capacity => line[12],
      :alcoholicity => line[13],
      :variety => line[14],
      :rating => line[15],
      :rating_rp => line[16],
      :rating_ws => line[17],
      :rating_jr => line[18],
      :trade_price => line[19].try(:to_f),
      :act_price => line[20].try(:to_f),
      :disc_rate => line[21],
      :wine_list_price => line[22],
      :final_list_price => line[22],
      :source => line[24],
      :info => line[25],
      :description => line[27],
      :remark => line[28],
      :tasting_notes_en => line[29],
      :tasting_notes_cn => line[30],
      :enclosure => line[31],
      :bottle_format => line[32],
      :price => line[22]
  )
end

require 'csv'
namespace :app do

  desc "init Wines data"
  task :init_wines => :environment do
    filename = Rails.root.join('lib', 'tasks', 'wines.csv')
    CSV.open(filename, :headers => true).each do |line|
      begin
        wine = init_by_csv(line)
        
        # upload image
        if line[26].present?
          file_path = Rails.root.join('lib', 'tasks', 'pic_emw', line[26])
          if File.exist? file_path
            image_file = File.open(file_path)
            image = wine.create_image(image_file)
            wine.photo_id = image.id
          end
        end
        wine.save
      rescue Exception => e
        puts "==========================#{line[3]}\n======================="
        puts e
      end
    end
  end

  desc "Init Api Sale Type"
  task :init_api_sale_type => :environment  do
   Api::SaleType.init
  end

  desc "Generate API DATABASE"
  task  :init_api_database => :environment do

   Api::SaleType.init
    # init region
    Api::CategoryRegionKeyword.init
    # init variety
    Api::CategoryVarietyKeyword.init
    # init wine style
    Api::CategoryWinetypeKeyword.init
    # init Wines
    Api::Wine.init
    # init Wine Sale
    Api::WineSale.init
    # init Foods & Food Items
    Api::Food.init
    # init Water & Water Items
    Api::Water.init
    # init Task Flight & Task Flight Items
    Api::TastingFlight.init
  end

end
