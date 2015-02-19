require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'chisel'

class ChiselTest < Minitest::Test

  def test_it_exists
    assert Chisel
  end

  def test_parser_exists
    chisel = Chisel.new
    assert chisel.respond_to?(:parser)
  end

  def test_parser_changes_test_to_h1
    chisel = Chisel.new
    assert_equal "<h1>", chisel.parse_h1("#") 
  end



end
