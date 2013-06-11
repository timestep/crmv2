#!/usr/bin/env ruby -wKU

class Database

	attr_accessor :database

	def initialize
		@database = []
	end

	def database_status
		contact = {:FirstName => "Hooligan"}
		@database = [contact]
	end

end
