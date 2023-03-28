str = "())((())"
str2 = "(())"
str3 = "())(()"

def validate_str(str)
  return "not valid" if str.split.first == ')'
  stack = []
  str.split("").each do |c|
    if c == '('
      stack << c
    else
      stack.shift
    end
  end
  stack.size == 0 ? 'Is valid' : "is not valid"
end

puts validate_str(str3)
