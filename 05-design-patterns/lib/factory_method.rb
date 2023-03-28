# frozen_string_literal: true

#
# This is the creator class template for concrete creators.
#
class FactoryMethod
  #
  # Method to create instance of any subclass
  #
  # @return [Concrete Class Instance] The instance of a concrete class
  #
  def factory_method
    raise NoImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def some_operatin
    concrete_instance = factory_method

    "Creator: the same creator's method just worked with #{concrete_instance.operation}"
  end
end

#
# Concrete creator to manage in FactoryMethod class
# A ConcreteCreator manages a concrete product
#
class ConcreteCreator1 < FactoryMethod
  #
  # The implementation of factory?method for this concrete class
  #
  # @return [ConcreteProduct1] Instance of product 1
  #
  def factory_method
    ConcreteProduct1.new
  end
end

#
# Concrete creator to manage in FactoryMethod class
# A ConcreteCreator manages a concrete product
#
class ConcreteCreator2 < FactoryMethod
  #
  # The implementation of factory?method for this concrete class
  #
  # @return [ConcreteProduct2] Instance of product 2
  #
  def factory_method
    ConcreteProduct2.new
  end
end

#
# A template for products
#
class Product
  #
  # A method to be implemented by concrete products
  #
  def operation
    raise NoImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

#
# Concrete product with real business logic
#
class ConcreteProduct1 < Product
  def operation
    'operation for Product 1'
  end
end

#
# Concrete product with real business logic
#
class ConcreteProduct2 < Product
  def operation
    'operation for Product 2'
  end
end
