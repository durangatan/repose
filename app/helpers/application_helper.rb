module ApplicationHelper
	def date_format(date)
		date.strftime("%A, %d %b %Y %l:%M %p")
	end

end
