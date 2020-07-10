class House
  attr_reader :price
  include Comparable

  def initialize(price)
    @price = price
  end
  
  def <=>(other)
    price <=> other.price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2
puts "Home 2 is more expensive" if home2 > home1

=begin
The use of comparable seems to be an ideal way to compare as it allows the use of multiple comparison methods by implementing one method (<=>). However the criteria of comparing prices may not be sufficient for comparing houses. Houses may need to be compared using multiple attributes and in those cases that may require manual implementation of <, >, etc.
=end