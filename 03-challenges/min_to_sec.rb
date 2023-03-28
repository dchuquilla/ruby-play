class Integer
  def min_to_sec
    self * 60
  end

  def age_to_days
    self * 365 + (self / 4)
  end
end

p 5.min_to_sec
p 65.age_to_days
