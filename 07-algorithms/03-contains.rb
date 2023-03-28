require "minitest/autorun"

#
# Implement the contains_all? method
#
# The contains_all? method accepts two array arguments, inputs and supply. It
# should return true if all elements in inputs are included in supply, otherwise
# it should return false.
#
def contains_all?(inputs, supply)
  return true if inputs.nil?
  # the supply is null but the inputs are empty
  return true if supply.nil? && inputs.empty?
  # if they were array
  if inputs.class.name != 'Array' || supply.class.name != 'Array'
    inputs = [inputs] if inputs.class.name != 'Array'
    supply = [supply] if supply.class.name != 'Array'
    return inputs == supply
  else
    # inputs is larger than supply
    return false if inputs.length > supply.length
    return true if inputs.empty?
  end
  contains_ok = true

  supply_counter = Hash.new(0)
  input_counter = Hash.new(0)
  inputs.map do |i|
    input_counter[i] += 1
  end
  supply.each do |i|
    supply_counter[i] += 1
  end
  inputs.uniq.each do |x|
    if(!supply_counter.has_key?(x) || supply_counter[x] < input_counter[x])
      contains_ok = false
      break
    end
  end
  return contains_ok
end

describe "contains_all?" do

  describe "with perfect input" do

    it "should return true for an empty set of inputs" do
      inputs = []
      supply = ['a', 'b', 'c']
      run_test(inputs, supply, true)
    end

    it "should return true if all inputs are in the supply" do
      inputs = ['a']
      supply = ['a']
      run_test(inputs, supply, true)
    end

    it "should return false if not all the inputs are in the supply" do
      inputs = ['a']
      supply = ['b']
      run_test(inputs, supply, false)
    end

    it "should return true if the inputs are in a different order but are all present in the supply" do
      inputs = ['a', 'b', 'c']
      supply = ['b', 'a', 'c']
      run_test(inputs, supply, true)
    end

    it "should return false if the supply does not have all values from the input" do
      inputs = ['a', 'b', 'c']
      supply = ['a', 'b']
      run_test(inputs, supply, false)
    end

    it "should return true if supply contains extra values" do
      inputs = ['a', 'b', 'c']
      supply = ['b', 'q', 'r', 'n', 'a', 'c']
      run_test(inputs, supply, true)
    end

    it "should return false if the supply is missing one input" do
      inputs = ['a', 'b', 'c']
      supply = ['q', 'r', 'n', 'a', 'c']
      run_test(inputs, supply, false)
    end

    it "should return false if not all individual inputs are represented in the supply" do
      inputs = ['a', 'a', 'b', 'c']
      supply = ['b', 'q', 'r', 'n', 'a', 'c']
      run_test(inputs, supply, false)
    end

    it "should return true if the supply contains more of the same input" do
      inputs = ['a', 'a', 'b', 'c']
      supply = ['b', 'a', 'a', 'a', 'c']
      run_test(inputs, supply, true)
    end

  end

  describe "with incorrect user input" do

    it "should return true for a null set" do
      inputs = nil
      supply = []
      run_test(inputs, supply, true)
    end

    it "should return true if the supply is null but the inputs are empty" do
      inputs = []
      supply = nil
      run_test(inputs, supply, true)
    end

    it "should return true if they're both null" do
      inputs = nil
      supply = nil
      run_test(inputs, supply, true)
    end

    it "should handle values as if they were arrays" do
      inputs = 0
      supply = 0
      run_test(inputs, supply, true)

      inputs = 1
      run_test(inputs, supply, false)

      inputs = 'a'
      supply = ['a']
      run_test(inputs, supply, true)

      inputs = ['a']
      supply = 'a'
      run_test(inputs, supply, true)
    end

  end

  private

  def run_test(inputs, supply, expected_result)
    result = contains_all?(inputs, supply)
    assert_equal expected_result, result
  end

end
