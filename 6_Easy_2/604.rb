class Transform
  attr_reader :input
  
  def initialize(input)
    @input = input
  end
  
  def uppercase
    input.upcase
  end
  
  def self.lowercase(new_input)
    new_input.downcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')