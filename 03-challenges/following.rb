class Integer
  def following
    follow = self
    follow + 1
  end
end

p 7.following
p(-7.following)
