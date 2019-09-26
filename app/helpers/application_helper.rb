module ApplicationHelper
  	def get_customer()
    	# set cumstomer name. CCH or SC. @xieyinghua
    	#'CCH'
    	'SC'
  	end

	def number_to_chinesenumber(num)
		case num
		when 0
			'日'
		when 1
			'一'
		when 2
			'二'
		when 3
			'三'
		when 4
			'四'
		when 5
			'五'
		when 6
			'六'
		end
	end
end
