#!/usr/bin/env ruby -wKU

require "test/unit"
require "../database.rb"

class DatabaseTest < Test::Unit::TestCase

	def setup
		@test = Database.new
	end

	def test_can_make_new_data_base
		assert @test
	end

	def test_array_initialize
		assert @test.database.is_a? Array
	end

	def test_empty_array
		assert_equal [], @test.database
	end

	# def test_make_new_contact
	# 	assert @contact 
	# end

	def test_check_contact
		@test.database_status
		assert @test.database[0].is_a? Hash
	end

	def test_check_contact_add
		user = {:FirstName => "Chuckles"}
		@test.database.add(user)
		assert @test.database[1].is_a? Hash
end