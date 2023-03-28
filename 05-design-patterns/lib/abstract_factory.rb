#
# This is a template for concrete factories
#
class AbstractFactory
  # Methods to be implemented in concrete factories
  def create_product_a
    raise NoImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def create_product_b
    raise NoImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

#
# Concrete creator for product types 1
#
class ConcreteFactory1 < AbstractFactory
  def create_product_a
    ConcreteProductA1.new
  end

  def create_product_b
    ConcreteProductB1.new
  end
end

#
# Concrete creator for product types 2
#
class ConcreteFactory2 < AbstractFactory
  def create_product_a
    ConcreteProductA2.new
  end

  def create_product_b
    ConcreteProductB2.new
  end
end

#
# Template class for products of family A
#
class AbstractProductA
  # @abstract
  #
  # @return [String]
  #
  def useful_function_a
    raise NoImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

#
# Concrete product family A type 1
#
class ConcreteProductA1 < AbstractProductA
  def useful_function_a
    'result of product A1'
  end
end

#
# Concrete product family A type 2
#
class ConcreteProductA2 < AbstractProductA
  def useful_function_a
    'result of product A2'
  end
end

#
# Template class for products of family B
#
class AbstractProductB
  # @abstract
  #
  # @return [String]
  #
  def useful_function_b
    raise NoImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  # @abstract
  #
  # @return [String]
  #
  def another_useful_function_b(_colaborator)
    raise NoImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

#
# Concrete product family B type 1
#
class ConcreteProductB1 < AbstractProductA
  def useful_function_b
    'result of product B1'
  end

  def another_useful_function_b(colaborator)
    result = colaborator.useful_function_a
    "B1 collaborating with the {#{result}}"
  end
end

#
# Concrete product family B type 2
#
class ConcreteProductB2 < AbstractProductA
  def useful_function_b
    'result of product B2'
  end

  def another_useful_function_b(colaborator)
    result = colaborator.useful_function_a
    "B2 collaborating with the {#{result}}"
  end
end
