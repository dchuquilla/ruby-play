def squaresSum
  n = 50
  counter = n-1
  list = [counter]
  loop do
    break if counter == 1
    counter -= 1
    list_sum = list.sum {|x| x**2}
    p " #{list_sum + (counter**2)}  -  #{counter} "
    list << counter if list_sum + (counter**2) <= n**2
  end
  p list.sum {|x| x**2}

  list.length > 3 ? list.reverse! : nil
end
p squaresSum
