class Vehicle
  attr_reader :make, :model
  
  def initialize(make, model)
    @make = make
    @model = model
  end
  
  def to_s
    "#{make} #{model}"
  end
end

class Car < Vehicle
  def wheels
    4
  end
end

class Motorcycle < Vehicle
  def wheels
    2
  end
end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end

  def wheels
    6
  end
end

=begin
In this case, it wouldn't make much sense to include wheel in Vehicle. This is because wheel only returns a number that is unique to each class. Including it in vehicle would mean more redundant code rather than less. However if wheel were doing more calculations some of which were shared, then including it in Vehicle might make sense.
=end