def find_max(arr)
  return nil if arr.empty?
  max = arr[0] # assume first element is max
  arr.each { |a| max = a if a > max }
  max
end
