#encoding: utf-8
module ApplicationHelper
	# wine rating
	def rating_select_option
		rating_arr = [
			["1星", 1],
			["2星", 2],
			["3星", 3],
			["4星", 4],
			["5星", 5]
		]
		options_for_select(rating_arr)
	end
end
