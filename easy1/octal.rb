=begin
implement octal-decimal conversion

input: octal string
output: decimal number
  - return 0 if input invalid

233 decimal
  sum of:
  3 * 10**0
  3 * 10**1
  2 * 10**2

233 octal
  sum of:
  3 * 8**0
  3 * 8**1
  2 * 8**2
  -> 3 + 24 + 128 = 155 decimal


- input e.g. '43786'
- valid input check -- helper method (no letters, all digits <= 7)
- map octal input str to array of integers => [4, 3, 7, 8, 6]
- reverse the array => [6, 8, 7, 3, 4]
  - idx now corresponds to exponent
- map to new array: el * 8**idx
- sum array
=end

# class Octal
#   def initialize(octal_str)
#     @octal_str = octal_str
#   end

#   def to_decimal
#     return 0 unless valid_octal?

#     octal_reversed = @octal_str.chars.map(&:to_i).reverse

#     octal_reversed.map.with_index { |digit, idx| digit * 8**idx }.sum
#   end

#   private
#   def valid_octal?
#     !(@octal_str =~ /[89\D]/)
#   end
# end

class Octal
  def initialize(octal_str)
    @octal_str = octal_str
  end

  def to_decimal
    return 0 if @octal_str =~ /[89\D]/

    octal_reversed = @octal_str.chars.map(&:to_i).reverse

    octal_reversed.map.with_index { |digit, idx| digit * 8**idx }.sum
  end
end

