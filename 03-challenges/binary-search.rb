# Searches through a list for a value in O(log(n)) time.
# The list must be sorted.
def binary_search(array, key)
  front = 0
  back = array.length - 1
  while front <= back
    middle = (front + back) / 2
    return middle if array[middle] == key

    if key < array[middle]
      back = middle - 1
    else
      front = middle + 1
    end
  end

  nil
end

array = (1..9).to_a
key = 9
puts binary_search(array, key)
