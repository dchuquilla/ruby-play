class Shape
  def area
    raise "Please implement 'area' method in #{self.class} subclass"
  end
end

class Triangle < Shape
  attr_accessor :sides

  def area(sides)
    sp = (sides.sum { |_k, v| v.to_i }) / 3
    Math.sqrt(sp * (sp - sides[:l1]) * (sp - sides[:l2]) * (sp - sides[:l3]))
  end
end

class Square < Shape
end

tri = Triangle.new
sides = { l1: 10, l2: 6, l3: 11 }
p tri.area(sides)

sq = Square.new
p sq.area
