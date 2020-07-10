class Cat
  @@cats = 0
  
  def initialize
    @@cats += 1
  end
  
  def self.total
    @@cats
  end
end

kitty1 = Cat.new
kitty2 = Cat.new

puts Cat.total