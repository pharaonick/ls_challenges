=begin
compute Hamming distance
unequal lengths -> compare shorter

7
GAGCCTACTAACGGGAT
CATCGTAATGACGGCCT
^ ^ ^  ^ ^    ^^

input: 2 strings consisting of various ACGT
  - validate input somehow?
output: integer representing number of bases that are not the same when 
  strands are laid side by side
  - compare shorter if unequal lengths but do not modify original length
  - empty string -> 0

- check which is shorter, if either
- (0...length).each { [i] increment count if str1[i] != str2[i] }

=end

# class DNA
#   def initialize(original_strand)
#     # validate input somehow
#     @original = original_strand
#   end

#   def hamming_distance(other_strand)
#     distance = 0
#     determine_length(other_strand).times do |idx|
#       distance += 1 if @original[idx] != other_strand[idx]
#     end
#     distance
#   end

#   private

#   def determine_length(other_strand)
#     @original.length <= other_strand.length ? @original.length : other_strand.length
#   end
# end

# this approach uses reduce, which makes more sense...
# and a more sensible method of determining the length
class DNA
  def initialize(original_strand)
    # validate input somehow
    @original_strand = original_strand
  end

  def hamming_distance(other_strand)
    effective_length = [@original_strand.size, other_strand.size].min
    (0...effective_length).reduce(0) do |distance, idx|
      @original_strand[idx] != other_strand[idx] ? distance += 1 : distance
    end
  end
end

strand = DNA.new('AGACAACAGCCAGCCGCCGGATT')
p strand.hamming_distance('AGACATCTTTCAGCCGCCGGATTAGGCAA')

### NOTE THAT YOU DON'T NEED TO KNOW WHICH IS LONGER/SHORTER, JUST
# WHAT THE LENGTH IS... Various ways to figure that out... see st. sols

# strand1 = 'AGACAACAGCCAGCCGCCGGATT'
# strand2 = 'AGACATCTTTCAGCCGCCGGATTAGGCAA'
# min, max = [strand1, strand2].sort_by(&:size)


# there is also a slice then zip approach





