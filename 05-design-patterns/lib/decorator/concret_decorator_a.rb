# concrete decorators call the wrapped object and alter its result in some way.
class ConcreteDecoratorA < Decorator
  # Decorators may call parent implementationof the operation, instead of
  # calling the wrapped object directly, This approach simplifies exrension of
  # decorator classes.
  def operation
    "ConcreteDecoratorA(#{@component.operation})"
  end

end
