=begin
Pig Latin
- if a word begins with vowel sound, add 'ay' sound to end of word
- if a word begins with consonant sound, move it to end of word and then add 'ay'

inferred rules:
- vowel sounds: a e i o u
                y-cons
                x-cons

- consonant sounds: all other letters
                    ch
                    qu
                    cons-qu
                    th
                    thr
                    sch


- slice out the first three chars
- case slice
  - sch || thr || cons-qu -> move slice to end of word, add 'ay'
  - th. || qu. || ch. || -> move slice[0..1] to end of word, add 'ay'
  - a || e || i || o || u || x-cons. || y-cons. -> add 'ay'
  - else move slice[0] to end of word, add 'ay'

first_three = word[0..2]

=end

class PigLatin
  def self.translate(string)
    string.split.map { |word| convert(word) }.join(' ')
  end

  private

  def self.convert(word)
    case word
    when /\A([aeiou].*)|([xy][^aeiou].*)/
      word << 'ay'
    when /\A((sch)|(thr)|(.qu)).*/
      word << word.slice!(0..2) << 'ay'
    when /\A((th)|(qu)|(ch)).*/
      word << word.slice!(0..1) << 'ay'
    else
      word << word.slice!(0) << 'ay'
    end
  end
end

###########
# ian has a super elegant version using gsub and capture groups/back references...

# there's of course a ton of ways to construct this class where the 
# regexps are saved to variables (as I initially thought to do...)
# - one for vowel sound and one for consonant sound

##### notes from the video...
=begin
seems the consonant sounds rule is slightly different than I inferred
  -> any number of consonants then vowel, group all consonants together?
  
=end













# Refactored to take advantage of the fact that the destructive slice
# modifies the word object for us so we don't need two steps

  # def self.convert(word)
  #   case word
  #   when /\A([aeiou].*)|([xy][^aeiou].*)/
  #     word << 'ay'
  #   when /\A((sch)|(thr)|(.qu)).*/
  #     first_three = word.slice!(0..2)
  #     word << first_three << 'ay'
  #   when /\A((th)|(qu)|(ch)).*/
  #     first_two = word.slice!(0..1)
  #     word << first_two << 'ay'
  #   else
  #     first_char = word.slice!(0)
  #     word << first_char << 'ay'
  #   end
  # end


# bunch of other fragments was playing with / pre-refactor...

  # def self.convert(word)
  #   first_three = word[(0..2)]

  #   case first_three
  #   when /([aeiou]..)|((x|y)[^aeiou].)/
  #     word << 'ay'
  #   when /(sch)|(thr)|(.qu)/
  #     word.slice!(3..-1) << first_three << 'ay'
  #   when /((th)|(qu)|(ch))./
  #     word.slice!(2..-1) << first_three[0..1] << 'ay'
  #   else
  #     word.slice!(1..-1) << first_three[0] << 'ay'
  #   end
  # end

  # def self.convert(word)
  #   first_three = word[(0..2)]

  #   if first_three.match(/[aeiou]../) || first_three.match(/x[^aeiou]./) || first_three.match(/y[^aeiou]./)
  #     word << 'ay'
  #   elsif first_three.match(/sch/) || first_three.match(/thr/) || first_three.match(/.qu/)
  #     word.slice!(3..-1) << first_three << 'ay'
  #   elsif first_three.match(/th./) || first_three.match(/qu./) || first_three.match(/ch./)
  #     word.slice!(2..-1) << first_three[0..1] << 'ay'
  #   else
  #     word.slice!(1..-1) << first_three[0] << 'ay'
  #   end
  # end


# class PigLatin
#   VOWELS = %w[a e i o u]
#   CONSONANTS = %w[b c d f g h j k l m n p q r s t v w x y z]
#   SPECIAL = %w[ch qu th thr sch] #### hmmmmmmmmm thr...

#   def self.translate(word)
#     if vowel?(word)
#       add_ay(word)
#     elsif special_case?(word)
#       # do this instead
#     elsif consonant?(word)
#       add_ay(shift_consonant(word))
#     end
#   end

#   def self.vowel?(word)
#     VOWELS.include?(word[0]) || 
#     (word[0] == 'y' || word[0] == 'x') && CONSONANTS.include?(word[1])
#   end

#   def self.consonant?(word)
#     CONSONANTS.include?(word[0])
#   end

#   def self.special_case?(word)

#   end

#   def self.add_ay(word)
#     word << 'ay'
#   end

#   def self.shift_consonant(word)
#     word_start = word[0]
#     (word.delete_prefix(word_start)) << word_start
#   end
# end