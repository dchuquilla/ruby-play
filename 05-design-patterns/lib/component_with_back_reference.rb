class ComponentWithBackReference
  attr_accessor :prototype

  def initialize(prototype)
    @prototype = prototype
  end
end
