class Integer
  def repeated?
    digits = to_s.chars.map(&:to_i)
    number = digits.first
    digits.each do |digit|
      return false if digit & number != number
    end
    true
  end
end

puts 55_555_554.repeated?
