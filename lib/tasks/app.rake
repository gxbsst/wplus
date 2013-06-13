#encoding: utf-8
def wine_id(name_en)
  name_en ||= 'Others'
  WineStyle.find_or_create_by_name_en(name_en).try(:id)
end

def parse_region(line)
  [line[3], line[4], line[5], line[6]].compact.join(' > ')
end

def wine_price(line)
  line[21].gsub(/[CN¥,]/,'').strip.try(:to_f)  if line[21].present?
end

def init_by_csv(line)
  puts "wine price: #{line[21]}\n"
  Refinery::Wines::Wine.new(
      :status => line[0],
      :bar_category => line[1],
      :wine_style_id => wine_id(line[2]),
      #3..6 is region
      :sku => line[7],
      # :chateau => line[8],
      :vintage => line[8],
      :name_en => line[9],
      :name_zh => line[10],
      :region => parse_region(line),
      :capacity => line[11],
      :alcoholicity => line[12],
      :variety => line[13],
      :rating => line[14],
      :rating_rp => line[15],
      :rating_ws => line[16],
      :rating_jr => line[17],
      :rating_am => line[18],
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
    ActiveRecord::Base.connection.execute("TRUNCATE refinery_wines")
    filename = Rails.root.join('lib', 'tasks', 'Masterfile_Winelist_20130606_for_Cameron-6.csv')
    CSV.open(filename, :headers => true).each do |line|
      # begin
        wine = init_by_csv(line)
        # upload image
        # if line[20].present?
        #   file_path = Rails.root.join('lib', 'tasks', 'winelist pics', line[20])
        #   if File.exist? file_path
        #     image_file = File.open(file_path)
        #     image = wine.create_image(image_file)
        #     wine.photo_id = image.id
        #   end
        # end

        puts "wine price: #{wine.price}\n"
        wine.save
      # rescue Exception => e
        puts "==========================#{line[10]}=======================\n"
        # puts e
      # end
    end
  end

  desc "Update Wines" 
  task  :update_wines => :environment do
    filename = Rails.root.join('lib','tasks', 'Masterfile_Winelist_20130606_for_Cameron.csv')
    CSV.open(filename, :headers => true).each do |line|
      status = line[0]
      bar_category = line[1]
      wine_style_id = wine_id(line[2]) 
      region = parse_region(line)
      sku = line[7]
      vintage = line[8]
      name_en = line[9]
      price = line[10].present? ? line[10].gsub(/[CN¥,]/,'').strip.try(:to_f) : 0
      source = line[11]
      wine = Refinery::Wines::Wine.find_or_create_by_vintage_and_name_en(vintage, 
                                                                         name_en,
                                                                         bar_category: bar_category,
                                                                         wine_style_id: wine_style_id,
                                                                         region: region,
                                                                         sku: sku,
                                                                         vintage: vintage,
                                                                         price: price,
                                                                         source: source
                                                                        )
      puts "#{vintage} #{name_en}\n"
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
    # Users
    Api::User.init
    # Table List
    Api::TableList.init

  end

end
