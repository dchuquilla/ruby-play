# frozen_string_literal: true
require "byebug"

def max_profit(prices)
  profit = 0

  prices.each_cons(2) do |buy, sell|
    profit += [sell - buy, 0].max
  end

  profit
end

prices = [7, 1, 5, 3, 6, 4]
p max_profit(prices) # => 7

prices = [1, 2, 3, 4, 5]
p max_profit(prices) # => 4

prices = [7, 6, 4, 3, 1]
p max_profit(prices)  # => 0
