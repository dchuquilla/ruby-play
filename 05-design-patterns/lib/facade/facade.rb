class Facade
  # Depending on your application needs, you can provide de Facade with
  # existing subsystems or force the Facade to create them on its own.
  def initialize(subsystem1, subsystem2)
    @subsystem1 = subsystem1 || Subsystem1.new
    @subsystem2 = subsystem2 || Subsystem2.new
  end

  # The facade methods are convenient shortcuts to the sophisticated
  # functionality of the subsystems. However, clients get only to a fraction of
  # a subsystem capabilities.
  def operation
    results = []
    results << 'Facade initializes subsystems:'
    results << @subsystem1.operation1
    results << @subsystem2.operation1
    results << 'Facade orders subsystems to perform the action:'
    results << @subsystem1.operation_n
    results << @subsystem2.operation_z

    results.join("\n")
  end
end
