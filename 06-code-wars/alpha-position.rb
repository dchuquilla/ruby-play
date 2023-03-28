require 'minitest/spec'
require "minitest/autorun"

def alphabet_position(text)
  text.downcase.gsub(/[^a-z]/, '').split("").map { |x| x.ord - 96 }.join(' ')
end

describe "Fixed tests" do
  it "should pass fixed tests" do
    assert_equal(alphabet_position("The sunset sets at twelve o' clock."), "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11")
    assert_equal(alphabet_position("-.-'"), "")
  end
end
