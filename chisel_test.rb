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

  def test_parse_h1_exists
    chisel = Chisel.new
    assert chisel.respond_to?(:parse_h1)
  end

  def test_parser_changes_test_to_h1
    chisel = Chisel.new
    assert_equal "<h1>", chisel.parse_h1("#")
  end

  def test_parse_h2_exists
    chisel = Chisel.new
    assert chisel.respond_to?(:parse_h2)
  end

  def test_parser_changes_test_to_h2
    chisel = Chisel.new
    assert_equal "<h2>", chisel.parse_h2("##")
  end



end
