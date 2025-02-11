# Write a function that prints "LCD display" style numbers at adjustable sizes
# For LCD style, think old school digital alarm clock, numbers made up of line segments
# that are either on or off.
# https://www.dreamstime.com/royalty-free-stock-images-digital-lcd-numbers-image11027229

# The function should receive two arguments:
# 1. a string version of the numbers to be displayed
# 2. an optional size variable with a default of two

# Example 1:
# lcd("012345") should print

"""
 --        --   --        --
|  |    |    |    | |  | |
|  |    |    |    | |  | |
           --   --   --   --
|  |    | |       |    |    |
|  |    | |       |    |    |
 --        --   --        --
"""

#Example 2:
# lcd("6789", size: 1) should print
"""
 -   -   -   -
|     | | | | |
 -       -   -
| |   | | |   |
 -       -   -
"""

#Example 3:
# lcd("0", size: 3) should print
"""
 ---
|   |
|   |
|   |

|   |
|   |
|   |
 ---
"""

BASE_LCD = {
  '0' => [" - ", "| |", "   ", "| |", " - "],
  '1' => ["   ", "  |", "   ", "  |", "   "],
  '2' => [" - ", "  |", " - ", "|  ", " - "]
}

def lcd(numbers, size = 1)
  result = numbers.chars.map do |number|
    BASE_LCD[number].map.with_index do |portion, index|
      if index.even?
        " " + portion.chars[1] * size + " " # horizontal
      else
        (0..size -1).map do |_v_portion|
          portion[0] + portion.chars[1] * size + portion[2]
        end  # vertical
      end
    end.flatten
  end

  (0..result.first.length - 1).each_with_index do |line, index|
    puts result.transpose[index].join(" ")
  end
end

lcd("012", 15)
