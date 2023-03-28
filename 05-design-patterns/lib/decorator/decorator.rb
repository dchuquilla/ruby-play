# the base decorator class follows the same interface as the other components.
# The primary purpose of this class is to define the wrapping interface for all
# concrete decorators. The default implementation of the wrapping code might
# include a field for storing a wrapped component and the means to initialize
# it.
class Decorator < Component
  attr_accessor :component

  def initialize(component)
    @component = component
  end

  # The decorator DELEGATES all work to the wrapped component.
  def operation
    @component.opertion
  end
end
