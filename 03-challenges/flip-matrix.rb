#!/bin/ruby

require 'json'
require 'stringio'



#
# Complete the 'flippingMatrix' function below.
#
# The function is expected to return an INTEGER.
# The function accepts 2D_INTEGER_ARRAY matrix as parameter.
#

def flippingMatrix(matrix)
    temp = matrix
    n = temp.first.size
    q = n/2
    sum = 0
    reversed_col = matrix.map{|r| r[q]}
    reversed_col.each do |rc|
        temp[n-1][q] = rc
        n -= 1
    end
    reversed_row = temp.first.reverse
    temp[0] = reversed_row
    (0..(q-1)).each do |i|
        (0..(q-1)).each do |j|
            sum += temp[i][j]
        end
    end
    sum

end

matrix = []

matrix << [107, 54, 128, 15] # [15, 128, 54, 107] # [15, 128, 54, 107] # [112, 128, 54, 107] # [112, 128, 54, 107]
matrix << [12, 75, 110, 138] # [12, 75, 110, 138] # [12, 75, 110, 138] # [100, 17, 110, 138] # [138, 110, 17, 100]
matrix << [100, 96, 34, 85]  # [100, 96, 34, 85]  # [100, 96, 34, 85]  # [12, 96, 34, 85]    # [12, 96, 34, 85]
matrix << [75, 15, 28, 112]  # [75, 15, 28, 112]  # [112, 15, 28, 75]  # [15, 15, 28, 75]    # [15, 15, 28, 75]

result = flippingMatrix matrix

p result
