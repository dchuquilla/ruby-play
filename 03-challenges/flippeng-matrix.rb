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
    p matrix
    n = matrix.size
    map = []
    s = 0

    for i in (0..n/2)
        for j in (0..n/2)
            row = [matrix[i][j], matrix[i][n-j-1], matrix[n-i-1][j], matrix[n-i-1][n-j-1]]
            s += row.max unless map.include?(row.sort)
            map << row.sort
        end
    end
    s
end

fptr = File.open('flippingMatrix.txt', 'w')

q = gets.strip.to_i

q.times do |q_itr|
    n = gets.strip.to_i

    matrix = Array.new(2 * n)

    (2 * n).times do |i|
        matrix[i] = gets.rstrip.split.map(&:to_i)
    end

    result = flippingMatrix matrix

    fptr.write result
    fptr.write "\n"
end

fptr.close()
