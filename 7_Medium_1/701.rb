class Machine
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end
  
  def use_getter
    switch 
  end
  
  private
  
  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end
mach = Machine.new
mach.start
puts mach.use_getter
mach.stop
puts mach.use_getter