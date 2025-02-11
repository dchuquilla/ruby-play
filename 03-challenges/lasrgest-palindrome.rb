# A palindromic number reads the same both ways. The largest palindrome made from the product of two
# 2-digit numbers is 9009 = 91 x 99

# Find the largest palindrome made from the product of two 3-digit numbers.

def largest_palindrome(how_many_digits)
  max_palindrome = 0
  maximum_number = maximum_number(how_many_digits)
  minimum_number = minimum_number(how_many_digits)

  maximum_number.downto(minimum_number).each do |a|
    maximum_number.downto(minimum_number).each do |b|
      product = a * b
      max_palindrome = product if is_palindrome?(product) && product > max_palindrome
    end
  end
  max_palindrome
end

def minimum_number(how_many_digits)
  10**(how_many_digits - 1)
end

def maximum_number(how_many_digits)
  (10**(how_many_digits) - 1)
end

def is_palindrome?(product)
  product.to_s == product.to_s.reverse
end

puts largest_palindrome(4)
