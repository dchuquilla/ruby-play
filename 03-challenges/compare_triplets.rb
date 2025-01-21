#!/bin/ruby

def compareTriplets(a, b)
    result = [0, 0]
    (0..2).each do |i|
        result[0] += 1 if a[i] > b[i]
        result[1] += 1 if a[i] < b[i]
    end
    result
end

a = [5, 6, 7]
b = [3, 6, 10]
result = compareTriplets a, b

puts result.inspect
