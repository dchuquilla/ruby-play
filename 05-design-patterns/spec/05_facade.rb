# frozen_string_literal: true

require 'facade/facade'
require 'facade/subsystems/subsystem1'
require 'facade/subsystems/subsystem2'

describe Facade do
  let(:subsystem1) { Subsystem1.new }
  let(:subsystem2) { Subsystem2.new }

  it 'Should run all facade operation' do
    facade = Facade.new(subsystem1, subsystem2)
    expect(facade.operation).to eq("Facade initializes subsystems:\nSubsystem1: Ready\nSubsystem2: Get ready\nFacade orders subsystems to perform the action:\nSubsystem1: Go\nSubsystem2: Fire")
  end
end
