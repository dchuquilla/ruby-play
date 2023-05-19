# frozen_string_literal: true

class SimpleCalculator

  ALLOWED_OPERATIONS = ['+', '/', '*']
  DISPLAY = '%<first_operand>s %<operation>s %<second_operand>s = %<result>s'

  private

  def initialize(first_operand, second_operand, operation)
    @first_operand = first_operand
    @second_operand = second_operand
    @operation = operation
  end

  public

  attr_reader :first_operand
              :second_operand
              :operation

  def to_s
    raise ArgumentError.new('Operand type not supported') if !@first_operand.is_a?(Numeric) || !@second_operand.is_a?(Numeric)

    raise UnsupportedOperation.new('Unsupported operation') unless ALLOWED_OPERATIONS.include?(@operation)

    return 'Division by zero is not allowed.' if @second_operand.zero?

    result = @first_operand.send(@operation, @second_operand)

    DISPLAY % {first_operand: @first_operand, second_operand: @second_operand, operation: @operation,
               result: result}
  end

  def self.calculate(first_operand, second_operand, operation)
    new(first_operand, second_operand, operation).to_s
  end

end

class SimpleCalculator::UnsupportedOperation < StandardError; end

