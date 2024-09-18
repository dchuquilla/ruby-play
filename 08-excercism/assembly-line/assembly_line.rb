class AssemblyLine
  def initialize(speed, cars = 221)
    @speed = speed
    @cars = cars
  end

  def production_rate_per_hour
    rate = @speed * @cars
    if @speed >= 1 && @speed <= 4
      rate
    elsif @speed > 4 && @speed <= 8
      rate * 0.9
    elsif @speed > 8 && @speed <= 9
      rate * 0.8
    else
      rate * 0.77
    end
  end

  def working_items_per_minute
    (production_rate_per_hour / 60.0).floor
  end
end
