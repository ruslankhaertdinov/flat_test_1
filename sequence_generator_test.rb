require "test/unit"
require "./sequence_generator"


class TestSequenceGenerator < Test::Unit::TestCase
  def test_text
    expected = %w(11 21 1211 111221 312211 13112221)
    g = SequenceGenerator.new
    expected.each { |e| assert_equal(e, g.next) }
  end
end