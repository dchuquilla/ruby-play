class AttributesInstances
  attr_writer :my_attribute_reader

  def initialize
    self.my_attribute_reader = 'Hello' # RISES NoMethodError: undefined method `my_attribute_reader=' for #<AttributesInstances:0x00007f8f3b8b3e40>
    # @my_attribute_reader = 'Hello' # instance variable used to set the value of the attribute
  end

  def show_me
    puts @my_attribute_reader # instance variable used to access the value of the attribute
    puts self.my_attribute_reader # attribute reader used to access the value of the attribute
  end
end

ai = AttributesInstances.new
ai.show_me
#=> Hello
#=> Hello
