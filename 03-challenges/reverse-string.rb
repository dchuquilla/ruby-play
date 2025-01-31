def reverse_string(str)
  chars = str.chars # convert to array
  left, right = 0, str.length - 1

  while left < right
    chars[left], chars[right] = chars[right], chars[left]
    left +=1
    right -= 1
  end

  return chars.join
end

str = "abcdef"
puts reverse_string(str)
