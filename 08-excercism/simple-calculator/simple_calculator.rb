# frozen_string_literal: true

module CalculatorExceptions

  class UnsupportedOperation < StandardError
    def initialize(message = 'Unsupported operation')
      super
    end
  end

  class OperandError < ArgumentError

    def initialize(message= 'Operand must be Numeric')
      super
    end

  end

end

class SimpleCalculator
  include CalculatorExceptions

  ALLOWED_OPERATIONS = ['+', '/', '*']
  DISPLAY = '%<operand_1>s %<operation>s %<operand_2>s = %<result>s'

  def self.calculate(first_operand, second_operand, operation)
    new(first_operand, second_operand, operation).to_s
  end

  private

  def initialize(first_operand, second_operand, operation)
    @operand_1 = first_operand
    @operand_2 = second_operand
    @operation = operation
    raise OperandError unless valid_operands?
    raise UnsupportedOperation unless valid_operator?
  end

  def valid_operator?
    ALLOWED_OPERATIONS.include?(@operation)
  end

  public

  attr_reader :operand_1,
    :operand_2,
    :operation

  def valid_operands?
    @operand_1.is_a?(Numeric) && @operand_2.is_a?(Numeric)
  end

  def to_s
    return 'Division by zero is not allowed.' if @operand_2.zero?

    result = @operand_1.send(@operation, @operand_2)

    DISPLAY % {operand_1: @operand_1, operand_2: @operand_2, operation: @operation, result: result}
  end

end

