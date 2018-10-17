=begin
compute scrabble score for word

Letter                           Value
A, E, I, O, U, L, N, R, S, T       1
D, G                               2
B, C, M, P                         3
F, H, V, W, Y                      4
K                                  5
J, X                               8
Q, Z                               10

input: word
output: score as int
  - 0 if input is empty string, string of spaces, nil

- split the word up into chars
- walk through, adding value of each letter to accumulator


=end

class Scrabble

  VALUES = {
    %w[A E I O U L N R S T] => 1,
    %w[D G]                 => 2,
    %w[B C M P]             => 3,
    %w[F H V W Y]           => 4,
    %w[K]                   => 5,
    %w[J X]                 => 8,
    %w[Q Z]                 =>10
  }

  def initialize(word)
    @word = word
  end

  def score
    return 0 if @word.nil?

    total = 0

    @word.each_char do |letter|
      VALUES.keys.each do |key|
        total += VALUES[key] if key.include?(letter.upcase)
      end
    end

    total
  end

  # can just invoke `new(word).score` here because `self` is the Scrabble class
  def self.score(word)
    Scrabble.new(word).score
  end
end

# maybe simpler way to approach is to map chars to values first then sum?

# can also do a more longform hash using symbols, e.g.
# {A: 1, F: 1, T: 1...}
# which means you can then use an easy reduce because don'thave the nested logic i do

# WOW PETE'S SOLUTION!!! Use case statement wrapped in method instead of hash...

# def points(letter)
#   case letter
#   when 'A', 'E', 'I', 'etc' then 1
#   when 'D', 'G' then 2
#     ...
#   else 0 # no need to cleanse input
#   end
# end
 
# WOW karl's solution too! 
# - calling map on chars and invoking gsub on the letter, replacing it with the hash score...


# REMEMBER READABILITY BETTER THAN DENSE LOGIC IN ONE LINE...


