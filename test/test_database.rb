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
end