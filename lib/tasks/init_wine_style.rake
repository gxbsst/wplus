#encoding: UTF-8
namespace :init_wine_style do
  # ## 初始化wine_style 基本数据
  task :init_data => :environment do
  	styles = [
      ['Red', '红葡萄酒'],
      ['White', '白葡萄酒'],
      ['Rose', '粉红葡萄酒'],
      ['Rosé', '粉红葡萄酒'],
      ['Red Sparkling', '起泡红葡萄酒'],
      ['White Sparkling', '起泡白葡萄酒'],
      ['Rose Sparkling', '起泡粉红葡萄酒'],
      ['Port', '波特酒'],
      ['Sherry', '雪利酒'],
      ['Sparkling', '起泡酒'],
      ['Other Fortified', '其它加强酒'],
      ['Others', '其它'],
      ['Champagne','香槟'],
      ['Fortified', '加强酒'],
      ['Sweet Wine', '甜酒']
    ]

    ActiveRecord::Base.connection.execute("TRUNCATE TABLE wine_styles")

    styles.each do |style|
    	wine_style = WineStyle.where(:name_en => style[0]).first_or_create(:name_zh => style[1])
    	puts "#{wine_style.name_en}   #{wine_style.name_zh}"
    end	
  end
	
end