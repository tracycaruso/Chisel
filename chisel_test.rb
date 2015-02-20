require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'chisel'

class ChiselTest < Minitest::Test

  def test_it_exists
    assert Chisel
  end

  def test_parse_h1_exists
    chisel = Chisel.new
    assert chisel.respond_to?(:parse_h1)
  end

  def test_parser_changes_test_to_h1
    chisel = Chisel.new
    assert_equal "<h1>This is a line</h1>", chisel.parse_h1("#This is a line")
  end

  def test_parse_h2_exists
    chisel = Chisel.new

  end

  def test_parser_changes_test_to_h2
    chisel = Chisel.new
    assert_equal "<h2>This is a line</h2>", chisel.parse_h2("##This is a line")
  end

  def test_parse_h3_exisits
    chisel = Chisel.new
    assert chisel.respond_to?(:parse_h3)
  end

  def test_parser_changes_test_to_h3
    chisel = Chisel.new
    assert_equal "<h3>This is a line</h3>", chisel.parse_h3("###This is a line")
  end

  def test_parse_h4_exisits
    chisel = Chisel.new
    assert chisel.respond_to?(:parse_h4)
  end

  def test_parser_changes_test_to_h4
    chisel = Chisel.new
    assert_equal "<h4>This is a line</h4>", chisel.parse_h4("####This is a line")
  end

  def test_parse_h5_exisits
    chisel = Chisel.new
    assert chisel.respond_to?(:parse_h5)
  end

  def test_parser_changes_test_to_h5
    chisel = Chisel.new
    assert_equal "<h5>This is a line</h5>", chisel.parse_h5("#####This is a line")
  end

  def test_parse_p_tag_exists
    chisel = Chisel.new
    assert chisel.respond_to?(:parse_p)
  end

  def test_parser_changes_test_to_p
    chisel = Chisel.new
    assert_equal "<p>test line</p>", chisel.parse_p("test line")
  end

  def test_break_line_exists
    chisel = Chisel.new
    assert chisel.respond_to?(:break_line)
  end

  def test_breaks_lines_by_new_line_char
    chisel = Chisel.new
    assert_equal ["This is", " a line"], chisel.break_line("This is\n a line")
  end

  def test_breaks_lines_by_two_new_line_char
    chisel = Chisel.new
    assert_equal ["This is", " a line"], chisel.break_line("This is\n\n a line")
  end

  def test_breaks_lines_with_multiple_newlines
    chisel = Chisel.new
    assert_equal ["This is", "a line", "This is", "a new line"], chisel.break_line("This is\n\na line\n\nThis is\na new line")
  end

  def test_parser_exists
    chisel = Chisel.new
    assert chisel.respond_to?(:parse)
  end

  def test_parser_takes_input
    chisel = Chisel.new
    assert_equal "Test input", chisel.parse("Test input")
  end

  def test_checks_for_five_hashes
    chisel = Chisel.new
    assert_equal "<h5>Test input</h5>", chisel.parse_headers("#####Test input")
  end

  def test_checks_for_four_hashes
    chisel = Chisel.new
    assert_equal "<h4>Test input</h4>", chisel.parse_headers("####Test input")
  end

  def test_checks_for_three_hashes
    chisel = Chisel.new
    assert_equal "<h3>Test input</h3>", chisel.parse_headers("###Test input")
  end

  def test_checks_for_two_hashes
    chisel = Chisel.new
    assert_equal "<h2>Test input</h2>", chisel.parse_headers("##Test input")
  end

  def test_checks_for_one_hashes
    chisel = Chisel.new
    assert_equal "<h1>Test input</h1>", chisel.parse_headers("#Test input")
  end


end
