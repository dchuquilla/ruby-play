def quickSort(arr, init, last)
  if(init < last)
    # locate pivot in the right place
    posOk = locatePivot(arr, init, last)
    # evaluate on left side
    quickSort(arr, init, posOk - 1)
    # evaluate on right side
    quickSort(arr, posOk + 1, last)
  end
end

def locatePivot(arr, init, last)
  while init < last
    while arr[last] >= arr[init] && init < last
      last -= 1
    end
    tmp = arr[last]
    arr[last] = arr[init]
    arr[init] = tmp
    while arr[init] <= arr[last] && init < last
      init += 1
    end
    tmp = arr[init]
    arr[init] = arr[last]
    arr[last] = tmp
  end
  return init
end


# arr = [1, 5, 2, 8, 4, 3, 9, 0, 7, 6]
# quickSort(arr, 0, arr.length-1)
# p arr
