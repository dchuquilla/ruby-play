# @param {Integer[]} nums
# @return {Integer}
def jump(nums)
  return 0 if nums.max.zero? || nums.size == 1
  return 1 if nums.size == 2
  jumps = nums[0]
  index = 0

  begin
    nums.shift(jumps)
    jumps = nums.first
    index += 1
  end while nums.length > 1

  index
end

nums = [2, 3, 1, 1, 4]
# nums = [1, 2, 1, 1, 1]
# nums = [1, 2, 0, 1]

p jump(nums)
