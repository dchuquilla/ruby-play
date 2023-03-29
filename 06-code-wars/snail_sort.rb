# frozen_string_literal: true

def snail(array)
  result = []
  while array.any?
    result += array.shift
    array.each { |row| result << row.pop } if array.any?
    result += array.pop.reverse if array.any?
    array.reverse_each { |row| result << row.shift } if array.any?
  end
  result
end

# this is a clever solution
# def snail(array)
#   array.empty? ? [] : array.shift + snail(array.transpose.reverse)
# end

require 'minitest/autorun'
class SnailTest < Minitest::Test
  def test_basic_input_3_x_3
    input = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    expected = [1, 2, 3, 6, 9, 8, 7, 4, 5]

    assert_equal expected, snail(input)
  end

  def test_basic_input_4_x_4
    input = [[1, 2, 3, 0], [4, 5, 6, 2], [7, 8, 9, 1], [1, 2, 3, 4]]
    expected = [1, 2, 3, 0, 2, 1, 4, 3, 2, 1, 7, 4, 5, 6, 9, 8]

    assert_equal expected, snail(input)
  end
end
