# the base component interface defines operations that can be alteres by
# decorators.
class Component
  def operation
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
