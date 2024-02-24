def generate_combinations(n, array, start = 0, prefix = [])
  if n == 0
    return [prefix]
  end

  combinations = []
  (start...array.length).each do |i|
    combinations += generate_combinations(n - 1, array, i + 1, prefix + [array[i]])
  end

  combinations
end

array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
puts generate_combinations(3, array)
