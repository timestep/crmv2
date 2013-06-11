#!/usr/bin/env ruby -wKU

class Database

	attr_accessor :database

	def initialize
		@database = []
	end

	def add_contact(contact)
		@database << contact
	end

end

class Contact

	attr_accessor :contact

	def initialize
		@contact = {}
	end

end
