#encoding: utf-8
def wine_id(name_en)
  name_en ||= 'Others'
  WineStyle.find_by_name_en(name_en).try(:id)
end

def parse_region(line)
 [line[3], line[4], line[5], line[6]].compact.join(' > ')
end

def wine_price(line)
  line[21].gsub(/[a-zA-Z¥]/,'').strip.try(:to_f)  if line[21].present?
end

def init_by_csv(line)
  Refinery::Wines::Wine.new(
      :status => line[0],
      :bar_category => line[1],
      :wine_style_id => wine_id(line[2]),
      #3..6 is region
      :tags => line[7],
      :chateau => line[8],
      :vintage => line[9],
      :name_en => line[10],
      :name_zh => line[11],
      :region => parse_region(line),
      :capacity => line[12],
      :alcoholicity => line[13],
      :variety => line[14],
      :rating => line[15],
      :rating_rp => line[16],
      :rating_ws => line[17],
      :rating_jr => line[18],
      :info => line[19],
      :description => line[19],
      #20 is image id
      :price => wine_price(line),
      :trade_price => wine_price(line),
      :act_price => wine_price(line),
      :disc_rate => wine_price(line),
      :wine_list_price => wine_price(line),
      :final_list_price => wine_price(line),
      :source => line[22],
      :tasting_notes_en => line[23],
      :tasting_notes_cn => line[24],
      :enclosure => line[25],
      :bottle_format => line[26],
      :remark => ''
  )
end

require 'csv'
namespace :app do

  desc "init Wines data"
  task :init_wines => :environment do
    filename = Rails.root.join('lib', 'tasks', 'Masterfile_Winelist_201302510.csv')
    CSV.open(filename, :headers => true).each do |line|
      begin
        wine = init_by_csv(line)
        
        # upload image
        if line[20].present?
          file_path = Rails.root.join('lib', 'tasks', 'winelist pics', line[20])
          if File.exist? file_path
            image_file = File.open(file_path)
            image = wine.create_image(image_file)
            wine.photo_id = image.id
          end
        end
        wine.save
      rescue Exception => e
        puts "==========================#{line[10]}=======================\n"
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
