def check_dups(arr)
  seen = {} # I see a dup
  arr.each { |a| return true if seen[a]; seen[a] = true } # Have I seen a dup? NO, so this is a dup
  false
end

arr = [1,2,3,4,5,6,7, 2]
puts check_dups(arr).inspect
