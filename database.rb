#!/usr/bin/env ruby -wKU

class Database

	attr_accessor :database

	def initialize
		@database = []
	end

	def add_contact(contact)
		if contact.is_a?(Hash)
			if @database.include? contact
				return false
			else
				@database << contact
				return true
			end
		end
	end

	def delete_contact(contact)
		@database.delete(contact){"Contact does not exist"}
	end

	def find_contact_with_firstname(firstname)
		0.upto(@database.size-1) do |x|
			if @database[x][:firstname] == firstname
				return @database[x]
			end
		end
		return false
	end

	def find_contact_with_lastname(lastname)
		0.upto(@database.size-1) do |x|
			if @database[x][:lastname] == lastname
				return @database[x]
			end
		end
		return false
	end

	def find_email(attribute)
		0.upto(@database.size-1) do |x|
			if @database[x].values.include? attribute
				return @database[x][:email]
			end
		end
	end

	def modify_contact(attribute, hashkey, newvalue)
		if find_contact_with_lastname(attribute)
			contact = find_contact_with_firstname(attribute)
		elsif find_contact_with_firstname(attribute)
			contact = find_contact_with_firstname(attribute)
		else
			return false
		end
		contact[hashkey] = newvalue
	end
	
end


class Contact

	attr_accessor :contact, :temp

	def initialize
		@contact = {:firstname => nil,
					:lastname => nil,
					:email => nil,
					:phone => nil,
					:note => nil
				}
	end

	def convert_input_to_hash(input)
		contact = {}
		if input.length==5
			contact[:firstname] = input[0]
			contact[:lastname] = input[1]
			contact[:email] = input[2]
			contact[:phone] = input[3]
			contact[:note] = input[4]
			return contact
		end
		return false
	end


end
