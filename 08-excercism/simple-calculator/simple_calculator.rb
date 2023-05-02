# frozen_string_literal: true

class SimpleCalculator

  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze
  DISPLAY = '%<first_operand>s %<operation>s %<second_operand>s = %<result>s'

  def self.calculate(first_operand, second_operand, operation)
    unless ALLOWED_OPERATIONS.include?(operation)
      raise UnsupportedOperation.new('Unsupported operation')
    end

    if operation == '/' && second_operand == 0
      return 'Division by zero is not allowed.'
    end

    begin
      result = 0
      case operation
      when '+'
        result = first_operand + second_operand
      when '-'
        result = first_operand - second_operand
      when '*'
        result = first_operand * second_operand
      when '/'
        result = first_operand / second_operand
      end
      DISPLAY % {first_operand: first_operand, second_operand: second_operand, operation: operation,
                 result: result}
    rescue TypeError
      raise ArgumentError.new('Operand type not supported')
    end
  end

end

class SimpleCalculator::UnsupportedOperation < StandardError; end
