def fibonacci(limit)
  return [] if limit <=0
  return [0] if limit == 1
  return [0,1] if limit == 2

  fib = [0,1] # initial fib state
  (limit - 2).times { fib << fib[-1] + fib[-2] }

  fib
end

puts fibonacci(10).inspect
