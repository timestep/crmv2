#!/usr/bin/env ruby -wKU

class Database

	attr_accessor :database

	def initialize
		@database = []
	end

	def add_contact(contact)
		# if contact.is_a? Hash
			if @database.include? contact
				return false
			else
				@database << contact
				return true
			end
		# end
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

	def convert_input_to_hash(input)
		@contact[:firstname] = input[0]
		@contact[:lastname] = input[1]
		@contact[:email] = input[2]
		@contact[:phone] = input[3]
		@contact[:note] = input[4]
		return @contact
	end


end
