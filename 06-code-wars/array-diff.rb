require 'rubygems'
require 'minitest/spec'
require "minitest/autorun"

def array_diff(a, b)
  # a.filter do |x|
  #   !b.include?(x)
  # end

  a - b
end

describe "Basic Tests" do
  it "should pass basic tests" do
    assert_equal(array_diff([1,2], [1]), [2], "a was [1,2], b was [1], expected [2]")
    assert_equal(array_diff([1,2,2], [1]), [2,2], "a was [1,2,2], b was [1], expected [2,2]")
    assert_equal(array_diff([1,2,2], [2]), [1], "a was [1,2,2], b was [2], expected [1]")
    assert_equal(array_diff([1,2,2], []), [1,2,2], "a was [1,2,2], b was [], expected [1,2,2]")
    assert_equal(array_diff([], [1,2]), [], "a was [], b was [1,2], expected []")
    assert_equal(array_diff([1,2,3], [1,2]), [3], "a was [1,2,3], b was [1, 2], expected [3]")
    assert_equal(array_diff([8, 16, 15, -19, 4, -15, 7, 4], []), [8, 16, 15, -19, 4, -15, 7, 4], "custom test")
  end
end
