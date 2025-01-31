# Given a sorted array of integers, find the largest consecutive sequence of integers in the array
# [1, 3, 4, 5, 8, 9, 10, 22, 23, 27, 28, 29, 30, 52, 63, 64, 65]
# => [27, 28, 29, 30]

def find_largest_sequence(arr)
  return 0 if arr.empty?

  result_arr = Array.new([])
  slice_index = 0

  arr.each_with_index do |num, index|
    if result_arr[slice_index].nil?
      result_arr[slice_index] = [num]
    else
      result_arr[slice_index] << num
    end

    slice_index +=1 if (index + 1) <= arr.length && !arr[index + 1].nil? && (num + 1) < arr[index + 1]
  end

  # result_arr.select do |portion|
  #   #puts result_arr.map(&:size).max
  #   # puts result_arr.inspect
  #   portion.length == result_arr.map(&:size).max
  # end

  result_arr.max_by(&:length)
end

arr = [1, 3, 4, 5, 8, 9, 10, 22, 23, 27, 28, 29, 30, 52, 63, 64, 65]
puts find_largest_sequence(arr).inspect
