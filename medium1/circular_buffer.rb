=begin
Circular buffer
length x
values written in to next available slot (wrapping round in array)
  cannot write value of nil, even if forced
values read out from oldest (in order), freeing slot
once full -> error saying further writes blocked until slot free
  can force write over oldest data


[][][][][][]
[nil, nil, nil, nil, nil]

write << unless idx >= size

=end

# LOL YOU MADE THIS FAAAAAAAR TOO COMPLICATED!
# A SIMPLE ARRAY OF ELS IS FINE, SINCE THE OLDEST WILL ALWAYS BE AT IDX 0
# PROVIDED YOU SHIFT IT OUT WHEN READ AND PUSH NEW ELS TO END
# THEN JUST NEED TO TRACK THE SIZE...
# EXCEEEEEEPT THAT IS NOT CIRCULAR BUT IS CRAWLING...
# ALSO, THIS IS THE PERFECT CANDIDATE TO WRITE A METHOD THAT YIELDS TO A 
# BLOCK IF THE BUFFER IS FULL...

# FIFO (first in first out, 'queue') -- Array#push & #shift
# LIFO (last in first out, 'stack') -- Array#push & #pop

# in fact, it's even worse! I've basically implemented a crawling buffer but
# in an unnecessarily complicated manner!!

class CircularBuffer
  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end

  def initialize(max_size)
    @max_size = max_size
    @elements = []
  end

  def read
    raise BufferEmptyException, 'Nothing in buffer' if elements.empty?
    elements.delete(oldest).value
  end

  def write(value)
    raise BufferFullException, 'Buffer is full' if full?
    add_element(value) unless value.nil?
  end

  def write!(value)
    return if value.nil?
    elements.delete(oldest) if full?
    add_element(value)
  end

  def clear
    self.elements = []
  end

  private

  attr_accessor :elements
  attr_reader :max_size

  def oldest
    elements.min_by(&:position)
  end

  def full?
    elements.length >= max_size
  end

  def add_element(value)
    elements << BufferElement.new(value)
  end
end

# written with class instance variable vs class variable...
class BufferElement
  attr_reader :value, :position

  @next_position = 0

  def self.next_position
    @next_position
  end

  def self.increment_next_position
    @next_position += 1
  end

  def initialize(value)
    self.class.increment_next_position
    @position = self.class.next_position
    @value = value
  end
end

# BufferElement with class var...
# class BufferElement
#   @@next_position = 0

#   attr_reader :value, :position

#   def initialize(value)
#     @@next_position += 1
#     @position = @@next_position
#     @value = value
#   end
# end
