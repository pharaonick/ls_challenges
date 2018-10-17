=begin
Sieve Eratosthenes

input: integer, n
output: array of integers: all the primes from 2..n


construct array 2..n -- [2, 3, 4, 5, 6, 7, 8, 9, 10]

iterate through, marking each el at (idx + el) as nil if it isn't already ***
next iteration if el is nil
flatten

(el * idx) % el == 0

=end

# arr = [2, 3, 4, 5, 6, 7, 8, 9, 10]
# arr = [nil, nil] + arr # [nil, nil, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# class Sieve
#   attr_reader :series
#   def initialize(n)
#     @series = [nil, nil] + (2..n).to_a # [nil, nil, 2, 3, 4, 5, 6 .. n]
#   end

#   def primes
#     series.each_with_index do |el1, i1|
#       next if el1.nil?
#       series.each_with_index do |el2, i2|
#         next if el2.nil? || i2 <= i1
#         series[i2] = nil if el2 % el1 == 0
#       end
#     end
#     series.compact
#   end
# end


class Sieve
  def initialize(n)
    @series = (2..n).to_a
  end

  def primes
    2.upto(@series.last) do |num|
      @series.reject! { |number| num != number && number % num == 0}
    end
    
    @series
  end
end

s = Sieve.new(10)

s.primes










# reject is the opposite of select..........