class ActiveSupport::TimeWithZone	
	def admin_format
		self.strftime("%d-%b-%Y, %I:%M %p")
	end
end