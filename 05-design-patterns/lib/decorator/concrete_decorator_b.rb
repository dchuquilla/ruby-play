# Decorators can execute their behavior ither befor of after the call to a
# wrapped object.
class ConcreteDecoratorB < Decorator
  def operation
    "ConcreteDecoratorB(#{@component.operation})"
  end

end
