def find_odds(arr)
  arr.select(&:odd?)
end

arr = [1, 2,4,6,8,10]
puts find_odds(arr).inspect
