module Duck
  def fly
    'Docuk flies'
  end

  def swim
    'Duck swims'
  end

  def walk
    'Duck walks'
  end

  def quack
    'quack'
  end
end

class DaffyDuck
  include Duck

  def walk
    super + ' <Include suport overwritting>'
  end
end

class WoodDuck
  extend Duck

  def quack
    quack + ' <Extends do not support overwritting>'
  end
end

# Include ALWAYS will work as instance
daffy = DaffyDuck.new
p daffy.quack
p daffy.walk
begin
  DaffyDuc.quack
rescue StandardError => e
  p 'Daffy includes Duck module, it has to use an instance to work -> ' + e.message
end

# extend work as class methods
p WoodDuck.quack
