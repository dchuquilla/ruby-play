class Integer
  def fib
    return self if self < 2

    (self - 1).fib + (self - 2).fib
  end
end

(1..20).each { |x| p x.fib }
