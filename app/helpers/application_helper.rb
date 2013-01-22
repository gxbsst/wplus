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
end
