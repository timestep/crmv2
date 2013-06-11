#!/usr/bin/env ruby -wKU

class Database

	attr_accessor :database

	def initialize
		@database = []
	end

	def add_contact(contact)
		if @database.include? contact
			return false
		else
			@database << contact
			return true
		end
	end

	def delete_contact(contact)
		@database.delete(contact){"Contact does not exist"}
	end
end

class Contact

	attr_accessor :contact

	def initialize
		@contact = {:firstname => nil,
					:lastname => nil,
					:email => nil,
					:phone => nil,
					:note => nil
				}
	end
end
