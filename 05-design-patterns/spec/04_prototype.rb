# frozen_string_literal: true

require 'prototype'
require 'component_with_back_reference'

describe Prototype do
  let(:p1) { Prototype.new }

  context "when clonning with prototype" do
    before do
      p1.primitive = 245
      p1.component = Time.now
      p1.circular_reference = ComponentWithBackReference.new(p1)
    end

    it 'should clone fields values' do
      p2 = p1.clone

      aggregate_failures do
        expect(p1.primitive).to eq(p2.primitive)
        expect(p1.component).to eq(p2.component)
      end
    end

    it 'should clone a component with back reference' do
      p2 = p1.clone
      aggregate_failures do
        expect(p1.circular_reference).not_to eq(p2.circular_reference)
        expect(p1.circular_reference.prototype).not_to eq(p2.circular_reference.prototype)
      end
    end

  end

end
