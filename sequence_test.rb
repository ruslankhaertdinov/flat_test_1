require "test/unit"
require "./sequence"


class TestNextEl < Test::Unit::TestCase
  def test_next_el
    expected = %w(1 11 21 1211 111221 312211 13112221)
    assert_equal(expected, next_el('1', 7))

    expected = %w(3 13 1113 3113 132113)
    assert_equal(expected, next_el('3', 5))
  end

end