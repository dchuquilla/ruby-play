# frozen_string_literal: true

class SquareMatrix
  attr_reader :matrix

  def initialize(matrix)
    @matrix = matrix
  end

  def find_square_matrix
    return 0 if @matrix.empty?

    row = @matrix.size
    col = @matrix[0].size
    max = 0

    (0...row).each do |i|
      (0...col).each do |j|
        next if @matrix[i][j].zero?

        if i.positive? && j.positive?
          @matrix[i][j] = 1 + min_value(i, j)
        end

        max = @matrix[i][j] if @matrix[i][j] > max
      end
    end

    max
  end

  private

  def min_value(i, j)
    [@matrix[i - 1][j], @matrix[i][j - 1], @matrix[i - 1][j - 1]].min
  end
end

require 'minitest/autorun'


class SquareMatrixTest < Minitest::Test
  def test_find_square_matrix
    assert_equal 3, SquareMatrix.new([[1, 1, 1], [1, 1, 1], [1, 1, 1]]).find_square_matrix
    assert_equal 5, SquareMatrix.new([[1, 1, 1, 1, 1], [1, 1, 1 ,1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1]]).find_square_matrix
    assert_equal 4, SquareMatrix.new([[1, 1, 1, 1, 0], [0, 1, 1 ,1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1]]).find_square_matrix
    assert_equal 1, SquareMatrix.new([[1, 0, 0, 1, 0], [0, 1, 0, 1, 0], [1, 0, 0, 1, 0], [0, 1, 0, 1, 0],[1, 0, 0, 1, 0]]).find_square_matrix
  end

  def test_find_square_matrix_with_empty_matrix
    assert_equal 0, SquareMatrix.new([]).find_square_matrix
  end

  def test_find_square_matrix_with_single_element
    assert_equal 1, SquareMatrix.new([[1]]).find_square_matrix
  end

  def test_find_square_matrix_with_single_element
    assert_equal 0, SquareMatrix.new([[0]]).find_square_matrix
  end
end
