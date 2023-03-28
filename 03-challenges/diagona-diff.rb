#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'diagonalDifference' function below.
#
# The function is expected to return an INTEGER.
# The function accepts 2D_INTEGER_ARRAY arr as parameter.
#

def diagonalDifference(arr)
    row_length = arr.first.size - 1
    index = 0
    da_sum = []
    db_sum = []
    arr.each do |row|
        da_sum << row[index].to_i
        db_sum << row[row_length].to_i
        index += 1
        row_length -= 1
    end
    (db_sum.sum - da_sum.sum).abs
end


arr = []

arr << %w(6 8)
arr << %w(-6 9)

result = diagonalDifference arr

p result
