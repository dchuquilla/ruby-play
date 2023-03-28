# frozen_string_literal: true

require 'abstract_factory'

describe AbstractFactory do
  let(:factory1) { ConcreteFactory1.new }
  let(:factory2) { ConcreteFactory2.new }
  describe 'products creation' do
    it 'should create products for family A' do
      product_a1 = factory1.create_product_a
      product_a2 = factory2.create_product_a

      aggregate_failures do
        expect(product_a1.useful_function_a.to_s).to eq('result of product A1')
        expect(product_a2.useful_function_a.to_s).to eq('result of product A2')
      end
    end
    it 'should create products for family B' do
      product_b1 = factory1.create_product_b
      product_b2 = factory2.create_product_b

      aggregate_failures do
        expect(product_b1.useful_function_b.to_s).to eq('result of product B1')
        expect(product_b2.useful_function_b.to_s).to eq('result of product B2')
      end
    end
  end

  describe 'collaboration' do
    it 'B family should collaborate with A' do
      product_b = factory1.create_product_b
      product_a = factory2.create_product_a

      expect(product_b.another_useful_function_b(product_a).to_s).to eq('B1 collaborating with the {result of product A2}')
    end
  end
end
