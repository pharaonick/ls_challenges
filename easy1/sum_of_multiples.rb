=begin
input: integer multiples, integer end-point
  - multiples default to 3, 5
output: sum of all multiples up to end-point


for each el in array of multiples
  step through 1...end-point (i)
  adding i to multiples_array if i % el == 0 && multiples_array does not already include i
  sum multiples_array


multiples 3, 5
end-point 20

1...20 for 3
=end

require 'pry'
require 'pry-byebug'

class SumOfMultiples
  def initialize(*multiples)
    @multiples = *multiples
    binding.pry
  end

  def self.to(final_num)
    s = SumOfMultiples.new(3, 5)
    s.to(final_num)
  end

  def to(final_num)
    results = []
    @multiples.each do |multiple|
      results += (1...final_num).select { |i| i if i % multiple == 0 && !results.include?(i) }
    end
    results.sum
  end
end

  # a little beliktad...
  # easier to switch the nested loop so iterate over 1...x and call any? on multiples
  # can define the method as class method and for an instance call self.class
  # but if you are defining as an instance method, then within class method don't need to
      # assign new instance to variable, can just do
      # SumOfMultiples.new(3, 5).to(final_num)
      # though could also set up the @multiples ivar differently so it has a default

# Pete's solution is really good... a bit hard to follow initially
# but literally matches what a written out algo would be...


p SumOfMultiples.to(20)