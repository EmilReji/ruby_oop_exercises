require 'pry'

class CircularQueue
  attr_reader :buffer, :next_position, :oldest_position
  
  def initialize(size)
    @buffer = [nil] * size
    @next_position = 0
    @oldest_position = 0
  end

  def enqueue(object)
    unless @buffer[@next_position].nil?
      @oldest_position = increment(@next_position)
      # runs when next position is not nil aka has a value at next_position aka buffer is full
      # so when next position has a value, means buffer is full and oldest val will be overwritten
      # since the oldest position is being overwritten, new oldest position must be updated by incrementing
    end

    @buffer[@next_position] = object
    @next_position = increment(@next_position)
  end

  def dequeue
    binding.pry
    value = @buffer[@oldest_position] # pulls out value that is oldest
    @buffer[@oldest_position] = nil # overwrites that to nil
    @oldest_position = increment(@oldest_position) unless value.nil?
    # if value is not nil (aka queue has values to dequeue), then increments oldest; returns value
    # if value is nil, means queue is empty and nothing to dequeue; so oldest position not changed; returns value which is nil
    value # returns value; works with nil
  end

  private

  def increment(position)
    (position + 1) % @buffer.size 
    # when position is at last index and this is called, 
    # will end up setting that position to 0
    # ex. when index 2 and size is 3, then (2 + 1) % 3 yields 0 for position
    # ex. when index 0 and size is 3, then (0 + 1) % 3 yields 1 for position
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil