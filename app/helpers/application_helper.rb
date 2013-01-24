#encoding: utf-8
module ApplicationHelper
	# wine rating
	def rating_select_option(rating)
		rating_arr = [
			["评分", nil],
			["1星", 1],
			["2星", 2],
			["3星", 3],
			["4星", 4],
			["5星", 5]
		]
		options_for_select(rating_arr, :selected => rating)
	end

	def api_type_select_option
		api_type_hash = API_WINE_TYPE['all'].invert
		first_item = {'选择种类' => nil}
		options_for_select first_item.merge(api_type_hash)
	end
end
