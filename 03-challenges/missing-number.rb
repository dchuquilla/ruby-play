class Array
  def missing
    min = self.min
    max = self.max
    sorted = sort
    (min..max).each_with_index do |pointer, index|
      return pointer if pointer != sorted[index]
    end
  end
end

puts %w[5 6 8 9 3 4 2 1].to_a.missing
