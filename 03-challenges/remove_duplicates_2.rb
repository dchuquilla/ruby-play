# frozen_string_literal: true
require 'byebug'

def remove_duplicates(nums)
  return 0 if nums.empty?

  length = 0
  count_element = 1

  (1...nums.length).each do |itr|

    byebug

    if nums[itr] != nums[length]
      length += 1
      nums[length] = nums[itr]
      count_element = 1
    elsif count_element < 2
      length += 1
      nums[length] = nums[itr]
      count_element += 1
    end
  end

  length + 1
end

nums = [1, 1, 1, 2, 2, 2, 2, 2, 3]

remove_duplicates(nums)
