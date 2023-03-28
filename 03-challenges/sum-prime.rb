class Prime
  $current = 0
  def is_prime?(number:)
    counter = number
    return true if number == 1

    while counter > 2
      counter -= 1
      return false if (number % counter).zero?
    end
    true
  end
end

prime = Prime.new
puts (1..100).filter { |x| prime.is_prime?(number: x) }.sum(0)
