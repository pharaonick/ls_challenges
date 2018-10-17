=begin
convert integers -> Roman numerals
no need to go above 3000

I 1 ... IV 4
V 5
X 10 ... IX 9
L 50 ... XL 40
C 100 ... XC 90
D 500 ... CD 400
M 1000 ... CM 900

911 -> CMXI
1024 -> MXXIV


- break num into chars and reverse
  -> digits, tens, hundreds, thousands
- map to roman nums via hash
- reverse

- divmod 1000, 100, 10
- account for fives...

=end

# class Integer
#   def to_roman
#     roman_numeral = ''

#     roman_numeral << 'M' * (self / 1000)
#     roman_numeral << 'D' * (self % 1000 / 500)
#     roman_numeral << 'C' * (self % 500 / 100)
#     roman_numeral << 'L' * (self % 100 / 50)
#     roman_numeral << 'X' * (self % 50 / 10)
#     roman_numeral << 'V' * (self % 10 / 5)
#     roman_numeral << 'I' * (self % 5)

#     roman_numeral
#   end
# end

# CAN CALC TH, HU, TE, ON AND THEN DO IT AS A SERIES OF IF STATEMENTS TO ACCOUNT FOR 9 AND 4...

# the gsub here seems either a bit hacky or very cool, can't quite tell!
class Integer
  ROMAN_SUBS = {
    'IIII' => 'IV',
    'IIIII' => 'V',
    'IIIIIIIII' => 'IX',
    'XXXX' => 'XL',
    'XXXXX' => 'L',
    'XXXXXXXXX' => 'XC',
    'CCCC' => 'CD',
    'CCCCC' => 'D',
    'CCCCCCCCC' => 'CM'
  }


  def to_roman
    roman_numeral = ''

    roman_numeral << 'M' * (self / 1000)
    roman_numeral << 'C' * (self % 1000 / 100)
    roman_numeral << 'X' * (self % 100 / 10)
    roman_numeral << 'I' * (self % 10)

    roman_numeral.gsub(/(I{9}|I{4,5})|(X{9}|X{4,5})|(C{9}|C{4,5})/, ROMAN_SUBS)
  end
end

p 4539.to_roman


