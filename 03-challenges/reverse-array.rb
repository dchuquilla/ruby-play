class Array
  def reverse_order
    reversed = []
    each_with_index do |_point, index|
      reversed << self[0 - (index + 1)]
    end
    reversed
  end
end
a = %w[1 4 2 6 3]
puts a.join(',')
puts a.reverse_order.join(',')
