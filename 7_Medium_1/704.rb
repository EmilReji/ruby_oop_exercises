require 'pry'

class CircularQueue
  attr_reader :size, :array, :first, :next
  
  def initialize(buffer_size)
    @size = buffer_size
    @array = Array.new(@size)
    @first = 0
    @next = 0
  end
  
  def enqueue(item)
    if is_full?
      puts "The queue is full. Please dequeue first."
    else
      @array[@next] = item
      @next = (@next + 1) % @size
    end
  end
  
  def dequeue
    if is_empty?
      puts "The queue is empty. Please enqueue first."
      return nil
    else
      value = @array[@first]
      @array[@first] = nil
      @first = (@first + 1) % @size
    end
    
    return value
  end
  
  def is_full?
    @first == (@next + 1) % @size
    # means next (x. 1) is just under first (ex. 2)
    # means if you insert a value, wil
  end
  
  def is_empty?
    @first == @next
  end
  
  def to_s
    @array.dup.to_s
  end
end

queue = CircularQueue.new(3)
puts queue
queue.enqueue(1)
puts queue
queue.enqueue(2)
puts queue
binding.pry
queue.enqueue(3)
puts queue
queue.enqueue(4)
puts queue
puts queue.dequeue
puts queue


=begin
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
=end

