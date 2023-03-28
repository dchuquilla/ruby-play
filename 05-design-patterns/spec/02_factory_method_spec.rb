# frozen_string_literal: true

require 'factory_method'

describe FactoryMethod do
  let(:creator1) { ConcreteCreator1.new }
  let(:creator2) { ConcreteCreator2.new }
  it 'should create my instances' do
    expect(creator1.some_operatin).to eq("Creator: the same creator's method just worked with operation for Product 1")
    expect(creator2.some_operatin).to eq("Creator: the same creator's method just worked with operation for Product 2")
  end
end
