require 'minitest/spec'
require "minitest/autorun"

def productFib(prod)
  # fib = [0, 1]
  # (2..prod).each do |n|
  #   fib << fib.last(2).sum
  #   break if fib.last(2).first * fib.last(2).last >= prod
  # end
  # [fib.last(2).first, fib.last(2).last, fib.last(2).first * fib.last(2).last == prod]

  a, b = [0, 1]
  while prod > a * b
    a, b = [b, a + b]
  end
  [a, b, prod == a * b]
end


describe "Fixed tests" do
  it "should pass fixed tests" do
    assert_equal(productFib(4895), [55, 89, true])
    assert_equal(productFib(5895), [89, 144, false])
  end
end
