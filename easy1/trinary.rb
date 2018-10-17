=begin
input: trinary number as string
output: decimal integer
  - return 0 if input invalid

rules: trinary numbers only 0, 1, 2
last place 3**0
penultimate 3**1
then 3**2
etc

102012

2 * 3**0
1 * 3**1
0 * 3**2
2 * 3**3
0 * 3**4
1 * 3**5

=>
if number is reversed, value is digit * 3**idx
sum it

- check validity
- map string to digits array
- reverse array
- map to decimal value
- sum


=end

class Trinary
  def initialize(trinary_str)
    @trinary = trinary_str.chars.map(&:to_i) if valid_trinary?(trinary_str)
  end

  def valid_trinary?(trinary_str)
    !(trinary_str =~ /\D|[3-9]/)
  end

  def to_decimal
    return 0 unless @trinary
    @trinary = @trinary.reverse.map.with_index do |digit, idx|
      digit * 3**idx
    end

    @trinary.sum
  end
end

# cleaner regexp???
class Trinary
  def initialize(trinary_str)
    @trinary = trinary_str.chars.map(&:to_i) unless invalid_trinary?(trinary_str)
  end

  def invalid_trinary?(trinary_str)
    trinary_str.match(/[^0-2]/)
  end

  def to_decimal
    return 0 unless @trinary
    @trinary = @trinary.reverse.map.with_index do |digit, idx|
      digit * 3**idx
    end

    @trinary.sum
  end
end

# different order of ops
class Trinary
  def initialize(trinary_str)
    @trinary = /^[0-2]+$/ =~ trinary_str ? trinary_str : '0'
    # @trinary = trinary_str =~ /^[0-2]+$/ ? trinary_str : '0' # also works...
  end

  def to_decimal
    @trinary = @trinary.reverse.chars.map.with_index do |digit, idx|
      digit.to_i * 3**idx
    end

    @trinary.sum
  end
end

# NB THERE'S A VERY COOL SOLUTION BASED ON BASE RATHER THAN INDEX...!