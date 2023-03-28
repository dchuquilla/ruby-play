#
# Singleton to get a global unique instance
#
class Singleton
  @instance = new

  private_class_method :new

  #
  # Creator static method to create an instance of this calss
  #
  # @return [Singleton] Instance of this class
  #
  def self.create
    @instance
  end

  #
  # Verifies that there is only one instance of Singleton class
  #
  #
  def some_business_logic
    p "I'm #{self}, the only one instance of #{self.class} classs"
  end
end

# s1 = Singleton.create
# s2 = Singleton.create

# s1.some_business_logic
# s2.some_business_logic
