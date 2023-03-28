#!/bin/ruby
require 'pry'

def zigzag(arr)
  binding.pry
  n = arr.length
  k = (n+1)/2

  binding.pry
  (1..k-1).step(2).each do |i|
    binding.pry
    arr[i-1], arr[i] = arr[i], arr[i-1] if arr[i-1] > arr[i]
  end

  binding.pry
  return arr
end

arr = [1, 2, 3, 4, 5, 6, 7]
puts zigzag(arr)

