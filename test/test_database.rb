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

	# def test_contact_initialize_creates_empty_hash
	# 	assert @testcontact.contact.is_a? Hash
	# end

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
		contact2 = {:firstname=>"ruff"}
		@testdatabase.add_contact(contact1)
		@testdatabase.add_contact(contact2)
		assert_equal nil, @testdatabase.database[1]
	end

	def test_contact_initialize_creates_hash_with_keys_with_nil_values
		assert_equal nil, @testcontact.contact[:firstname]
		assert_equal nil, @testcontact.contact[:lastname]
		assert_equal nil, @testcontact.contact[:email]
		assert_equal nil, @testcontact.contact[:phone]
		assert_equal nil, @testcontact.contact[:note]
	end

	def test_contact_contains_information
		person = ["John","Smith","yol@mlg.com",416988000,"League of Legends is Da Best"]
		@testdatabase.add_contact(@testcontact.convert_input_to_hash(person))	
		assert_equal person[0], @testdatabase.database[0].fetch(:firstname)
		assert_equal person[1], @testdatabase.database[0].fetch(:lastname)
		assert_equal person[2], @testdatabase.database[0].fetch(:email)
		assert_equal person[3], @testdatabase.database[0].fetch(:phone)
		assert_equal person[4], @testdatabase.database[0].fetch(:note)
	end

	def test_add_contact_rejects_non_hash
		person = ["John","Smith","yol@mlg.com",416988000,"League of Legends is Da Best"]
		@testdatabase.add_contact(person)
		assert_equal [], @testdatabase.database
	end

	def test_convert_only_accepts_arrays_with_5_parameters
		person1 = ["John","Smith","yol@mlg.com",416988000]
		person2 = "this is a string"
		assert_equal false, @testcontact.convert_input_to_hash(person1)
		assert_equal false, @testcontact.convert_input_to_hash(person2)
	end

	def test_find_contact_with_firstname
		person1 = ["John","Smith","yol@mlg.com",416988000,"LOLOL"]
		person2 = ["Rocky","Balboa","yol@mlg.com",416988000,"GET WREKT"]
		@testdatabase.add_contact(@testcontact.convert_input_to_hash(person1))
		@testdatabase.add_contact(@testcontact.convert_input_to_hash(person2))
		assert_equal @testdatabase.database[1], @testdatabase.find_contact_with_firstname("Rocky")
		assert_equal @testdatabase.database[0], @testdatabase.find_contact_with_firstname("John")
	end

	def test_find_contact_with_lastname
		person1 = {:firstname=>"John", :lastname=>"Smith", :email=>"yol@mlg.com", :phone=>416988000, :note=>"LOLOL"}
		person2 = {:firstname=>"Rocky", :lastname=>"Balboa", :email=>"yol@mlg.com", :phone=>416988000, :note=>"GET WREKT"}
		@testdatabase.add_contact(person1)
		@testdatabase.add_contact(person2)
		assert_equal @testdatabase.database[1], @testdatabase.find_contact_with_lastname("Balboa")
		assert_equal @testdatabase.database[0], @testdatabase.find_contact_with_lastname("Smith")
	end

	def test_find_email_with_any_parameter
		person1 = ["John","Smith","yol@mlg.com",416988000,"LOLOL"]
		person2 = ["Rocky","Balboa","yol@mlg.com",416988000,"GET WREKT"]
		@testdatabase.add_contact(@testcontact.convert_input_to_hash(person1))
		@testdatabase.add_contact(@testcontact.convert_input_to_hash(person2))
		print @testdatabase.database
		assert_equal person2[2], @testdatabase.find_email("Rocky")
		assert_equal person1[2], @testdatabase.find_email("Smith")
	end



end