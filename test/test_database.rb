#!/usr/bin/env ruby -wKU

require "test/unit"
require "../database.rb"

class DatabaseTest < Test::Unit::TestCase

	def setup
		@testdatabase = Database.new
		@testcontact = Contact.new
	end

	def test_can_make_new_data_base
		assert @testdatabase
	end

	# def test_database_initialize
	# 	assert @testdatabase.database.is_a? Array
	# end

	def test_database_initialize_creates_empty_array
		assert_equal [], @testdatabase.database
	end

	# def test_make_new_contact
	# 	assert @contact 
	# end

	def test_contact_initialize_creates_empty_hash
		assert @testcontact.contact.is_a? Hash
	end

	def test_check_contact_add
		@testdatabase.add_contact(@testcontact.contact)
		assert @testdatabase.database[0].is_a? Hash
	end

	def test_check_contact_delete
		contact_to_add_then_delete = {}
		@testdatabase.add_contact(contact_to_add_then_delete)
		@testdatabase.delete_contact(contact_to_add_then_delete)
		assert_equal false, (@testdatabase.database.include? contact_to_add_then_delete)
	end

	def test_unique_contact
		contact1 = {:firstname=>"ruff"}
		contact2 = {:firstname=>"yolo"}
		contact1 = {:firstname=>"ruff"}
		@testdatabase.add_contact(contact1)
		@testdatabase.add_contact(contact2)
		@testdatabase.add_contact(contact1)
		assert_equal false, (@testdatabase.database[0] == @testdatabase.database[2])
	end
end