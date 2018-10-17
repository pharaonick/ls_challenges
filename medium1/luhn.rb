=begin
Luhn algo
- final digit of number is check digit
- counting left from check digit
  - double value of every second digit -> doubled_digit
    - if doubled_digit >= 10, subtract 9
  - sum all digits -> checksum
  - number valid according to Luhn formula if checksum % 10 == 0

1111 -> 1 + 2 + 1 + 2 = 6 -> 6 % 10 == 6 -> INVALID
8763 -> 3 + (12 - 9 = 3) + 7 + (16 - 9 = 7) -> 20 -> 20 % 10 == 0 -> VALID

input: integer, no spaces or string

output: - valid per Luhn?
        - return checksum or remainder
        - can add a check digit to make number valid & return that new number
          - 2323 2005 7766 355 -> 2323 2005 7766 3554


addends
num.digits -> reverses it, meaning checksum is the leftmost
map this array with index, where we double it if index is odd
  - subtract 9 if needed


=end

# DON'T FORGET THAT IN THE CLASS METHOD SELF IS THE CLASS SO YOU 
# DON'T NEED AN EXPLICIT CALLER FOR NEW
# ALSO, MOST PEOPLE CONVERTED TO ARRAY OF DIGITS VIA TO_S, CHARS, MAP(&:TO_I)
# PLUS A LOT OF PEOPLE DID A DOUBLE MAP RATHER THAN A CONDITIONAL TO DO THE >= 10 ADJUSTMENT

# and Nathan's way to determining the required check digit was interesting:
# iterate through 0..9, adding each in turn to num and checking to see if it
# became valid, oterhwise discarding and moving on (via next)

class Luhn
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def addends
    reversed_digits = @number.digits

    reversed_addends = reversed_digits.map.with_index do |digit, idx|
      if idx.even?
        digit
      else
        doubled = digit * 2
        doubled >= 10 ? doubled - 9 : doubled 
      end
    end

    reversed_addends.reverse
  end

  def checksum
    addends.sum
  end

  def valid?
    (checksum % 10).zero?
  end

  def self.create(number)
    luhn = new(number * 10)
    luhn.valid? ? luhn.number : luhn.number + (10 - luhn.checksum % 10)
  end
end







# some older code commented here...

# class Luhn
#   attr_reader :number

#   def initialize(number)
#     @number = number
#   end

#   def addends(non_doubled_idx = :even?)
#     reversed_digits = @number.digits

#     reversed_addends = reversed_digits.map.with_index do |digit, idx|
#       if idx.send(non_doubled_idx)
#         digit
#       else
#         doubled = digit * 2
#         doubled >= 10 ? doubled - 9 : doubled 
#       end
#     end

#     reversed_addends.reverse
#   end

#   def checksum
#     addends.sum
#   end

#   def valid?
#     (checksum % 10).zero?
#   end

#   # easier way to do it might be to add an arbitrary check digit of 0 so the instance methods work as-are...
#   def self.create(number)
#     # luhn = Luhn.new(number)

#     # checksum_no_check_digit = luhn.addends(:odd?).sum

#     # check_digit = (checksum_no_check_digit % 10).zero? ? 0 : 10 - (checksum_no_check_digit % 10)

#     # number.digits.unshift(check_digit).reverse.join.to_i

#     luhn = Luhn.new(number * 10)

#     # return luhn.number if luhn.valid?

#     # check_digit = 10 - (luhn.checksum % 10)

#     # luhn.number + check_digit

#     luhn.number + (luhn.valid? ? 0 : 10 - (luhn.checksum % 10))
#   end
# end

# p Luhn.create(123)
# p Luhn.create(873_956)






