=begin
Write a program that will take a string of digits and give you all 
the possible consecutive number series of length n in that string.

For example, the string "01234" has the following 3-digit series:
012
123
234

And the following 4-digit:
0123
1234

input: string of digits, length of slice (n)
output: array of consecutive slices of length n, where each slice is an array

- break string into array of chars
- iterate through array with index, i
- for each el, push arr[i...i+n] to results
  - map?

WOWOWOOWOWOWOWOWOWOOW THIKN THIS THROUGH PROPERLY NEXT TIME!!!!
AND PUT SOME TEST CASES IN THIS DOC TO HELP YOU FIGURE OUT WHAT TO DO


=end

# class Series
#   def initialize(number_string)
#     @number_array = number_string.chars.map(&:to_i)
#   end

#   def slices(slice_length)
#     raise ArgumentError, 'slice length cannot exceed digits in number' if slice_length > @number_array.size

#     final_index = @number_array.size - slice_length
#     slice_array = []
    
#     0.upto(final_index) do |idx|
#       slice_array << @number_array[idx...idx + slice_length]
#     end

#     slice_array
#   end
# end

class Series
  def initialize(number)
    @numbers = number.chars.map(&:to_i)
  end

  def slices(slice)
    raise ArgumentError, 'slice length cannot exceed digits in number' if slice > @numbers.size

    final_index = @numbers.size - slice
    
    0.upto(final_index).map { |idx| @numbers[idx...idx + slice] }
  end
end



# s = Series.new('0123456')
# s.slices(1)





# class Series
#   def initialize(digits)
#     @digits = digits
#   end
  
#   def slices(length)
#     raise ArgumentError if length > @digits.size

#     slices_array = []

#     @digits.chars.each_with_index do |el, idx| 
#       slices_array << @digits[idx...idx + length] unless idx + length > @digits.size
#     end

#     slices_array = slices_array.map do |str|
#       str.each_char.map(&:to_i)
#     end

#     slices_array
#   end
# end 

# # Top LS solutions
# class Series
#   attr_reader :numbers

#   def initialize(string)
#     @numbers = string.each_char.map(&:to_i)
#   end

#   def slices(count)
#     fail ArgumentError.new("Slice is longer than input.") if count > numbers.length
#     numbers.each_cons(count).to_a
#   end
# end

# ##########
# class Series
#   attr_reader :string_of_digits

#   def initialize(string_of_digits)
#     @string_of_digits = string_of_digits
#   end

#   def slices(n)
#     raise ArgumentError, 'n is too big for the string.' if n > string_of_digits.size
#     string_of_digits.each_char.map(&:to_i).each_cons(n).to_a

#     ### original implementation
#     # result = []
#     # arr = string_of_digits.split('').map(&:to_i)
#     # while arr.size >= n
#     #   result << arr.take(n)
#     #   arr.reverse!.pop
#     #   arr.reverse!
#     # end
#     # result
#   end
# end

# ##########
# class Series
#   attr_reader :series

#   def initialize(series)
#     @series = series.chars.map(&:to_i)
#   end

#   def slices(slice_size)
#     validate_input(slice_size)

#     0.upto(series.size - slice_size)
#      .map { |position| series.slice(position, slice_size) }
#   end

#   private

#   def validate_input(size)
#     fail(ArgumentError, 'too big') if size > series.size
#   end
# end
