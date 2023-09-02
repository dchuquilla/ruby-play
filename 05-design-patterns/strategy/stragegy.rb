require 'active_support/core_ext/string'

# Strategy pattern
# this is the interface for all strategies
# it defines a method that all strategies must implement
# this is not required but it is a good practice
class ChartStrategy
  def initialize(data)
    @data = data
  end

  def generate
    raise NotImplementedError, 'You must implement the generate method in subclass'
  end
end

# CONCRETE STRATEGIES

# this is a concrete strategy for BAR charts
# it implements the generate method
class BarChartStrategy < ChartStrategy
  def generate
    puts 'Bar #######'
  end
end

# this is a concrete strategy for PIE charts
# it implements the generate method
class PieChartStrategy < ChartStrategy
  def generate
    puts 'Pie *****'
  end
end

# this is a concrete strategy for LINE charts
# it implements the generate method
class LineChartStrategy < ChartStrategy
  def generate
    puts 'Line -------'
  end
end

# CONTEXT
# this is the context class
# it is responsible for setting the strategy
# and excecute the strategy
class StrategyContext
  attr_accessor :strategy

  def initialize(strategy, data)
    @strategy = "#{strategy.capitalize}ChartStrategy".constantize.new(data)
  end

  def excecute
    @strategy.generate
  end
end

# CLIENT
# this is the client code
# it creates a context object and set the strategy
def show
  data = [1, 2, 3, 4, 5]
  strategy = StrategyContext.new('bar', data)
  strategy.excecute
  strategy = StrategyContext.new('pie', data)
  strategy.excecute
  strategy = StrategyContext.new('line', data)
  strategy.excecute
end

# call the client code and execute the program
show
