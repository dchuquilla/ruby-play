#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'lonelyinteger' function below.
#
# The function is expected to return an INTEGER.
# The function accepts INTEGER_ARRAY a as parameter.
#

def lonelyinteger(a)
    x = a.uniq
    count = x.map{|e| [e, a.count(e)]}
    count.filter{ |c| c.last == 1 }.first.first
end

a = [1, 2, 3, 4, 3, 2, 1]

result = lonelyinteger a

p result
