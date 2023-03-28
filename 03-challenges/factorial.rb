class Integer
  def !
    return 1 if self <= 1

    self * (self - 1).!
  end
end

p 5.!
