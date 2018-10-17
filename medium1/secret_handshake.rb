=begin
convert decimal number -> sequence of events for secret handshake

1 = wink (2**0 = 1)
10 = double blink (2**1 = 2)
100 = close your eyes (2**2 = 4)
1000 = jump (2**3 = 8)
10000 = Reverse the order of the operations in the secret handshake. (2**4 = 16)

9 is 1001 = 1000 + 1
handshake = SecretHandshake.new 9
handshake.commands # => ["wink","jump"]

= 10000 + 1000 + 1
handshake = SecretHandshake.new "11001"
handshake.commands # => ["jump","wink"]

strings specifying invalid binary -> 0


input: number as integer or string
output: array of operations as strings
  - empty array if input leads to invalid binary

reversed index: operation
0: wink
1: double blink
2: close your eyes
3: jump
4: reverse order


13 -> 1101 -> [1011] -> [wink, close eyes, jump]

- convert input -> binary via #to_s(2)
  - needs check if input is a string
- split into array of digits 
- if length is 5 and last is 1, chop off final el
    - else reverse
  - index now corresponds to above (with 4 chopped off if needed)
- map via hash lookup with default ''
- collapse the empty els

=end

class SecretHandshake
  OPERATIONS = ['wink', 'double blink', 'close your eyes', 'jump']

  def initialize(decimal)
    @bin_string = valid?(decimal) ? decimal.to_i.to_s(2) : '0'
  end

  def commands
    ops = bin_array.map.with_index { |b, idx| OPERATIONS[idx] if b == '1' }.compact
    @bin_string.length == 5 ? ops.reverse : ops
  end

  private

  def valid?(decimal)
    decimal =~ /^[0-9]+$/ || decimal.class == Integer
  end

  def bin_array
    @bin_string.each_char.to_a.reverse[0..3]
  end
end


