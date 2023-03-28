class Prime
  $current = 0
  def is_prime?(number:)
    counter = number
    return '1 is prime' if number == 1

    while counter > 2
      counter -= 1
      return "#{number} is not prime" if (number % counter).zero?
    end
    "#{number} is prime"
  end
end

prime = Prime.new
(1..50).each do |number|
  p prime.is_prime?(number:)
end
