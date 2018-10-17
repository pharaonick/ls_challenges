=begin
char set consisting of letters, space, point
words: 1-20 letters
       inferring that letters are lowercase only
input text: 1+ words separated by 1+ spaces terminated by 0+ spaces then 1 point.
            read from 1st letter first word..terminating point
            assuming input is valid (words 1..20 chars, str ends in point)
output text: words separated by 1 space, last word terminated by 1 point.
             odd words copied in reverse order
             even words echoed
             e.g.
             "whats the matter with kansas." -> "whats eht matter htiw kansas."
             BONUS
             characters must be read and printed one at a time

->
take a string, strip out any extra spaces between words and after the last word
return a string where words at odd indexes are reversed, and even echoed

split string -> array based on spaces/point
map to new array where odd indexed strings are reversed
join together with space, append point



=end

# def reverse_odd(str)
#   words = str.split(/ +|\./)
#   reversed_words = words.map.with_index do |word, idx|
#     idx.odd? ? word.reverse : word
#   end
#   reversed_words.join(' ') << '.'
# end

# # # BONUS -- READ AND PRINT CHARACTERS ONE AT A TIME...
# # remove extra spaces from original string
# # set word_index = 0 [CAN BE DONE AS TRUE/FALSE FLAG]
# # set start_index = 0
# # set results string
# # step through each char with index
# #   break if char == . [ NO NEED BECAUSE OF NOT-SPACE]
# #   if char is a space, check word_index
# #     if even, add chars from start_index to current index (of space) to results str
# #       increment word index
# #       start index = current idx + 1
# #     if odd, add chars from current idx -1 .. start_idx to results + a space
# #     increment word index
# #     start index = current idx + 1
# #   else next


def reverse_odd(str)
  stripped = str.gsub(/ +/, ' ').gsub(/ \./, '.')
  
  even = true
  start_index = 0
  results = ''

  stripped.each_char.with_index do |char, idx|
    if char == ' ' || char == '.'
      if even
        start_index.upto(idx) { |i| results << stripped[i] }
      else
        (idx - 1).downto(start_index) { |i| results << stripped[i] }
        results << char
      end
      even = !even
      start_index = idx + 1
    else
      next
    end
  end

  results
end

# kiiiiiiinda fits the one at a time req????!
def reverse_odd(str)
  spaces_stripped = str.gsub(/ +/, ' ').gsub(/ \./, '.')

  spaces_stripped.gsub(/ +\w+( +|\.)/) do |matched|
    matched.end_with?('.') ? " #{matched[1..-2].reverse}." : matched.reverse
  end
end

# This is another way to begin approaching, but doesn't hit the bonus reqs?
def reverse_odd(str)
  reversed = ''
  idx = 0
  str.scan(/\w+/) do |word|
    reversed << (idx.even? ? word + ' ' : word.reverse + ' ')
    idx += 1
  end
  reversed
end

# Word boundaries are where it's at..
# This reads it a character at a time but not sure can say it outputs it char by char...

def reverse_odd(str)
  results = ''
  even = true
  str.scan(/\b\w+\b/) do |word|
    results << (even ? word : word.reverse) << ' '
    even = !even
  end
  results.chop << '.'
end

p reverse_odd('one.') == 'one.' 

p reverse_odd('one   .') == 'one.'

p reverse_odd('one two.') == 'one owt.'

p reverse_odd('one    two    .') == 'one owt.'

p reverse_odd('one two three four    .') == 'one owt three ruof.'

p reverse_odd('one 2 three.') == 'one 2 three.'

p reverse_odd('one two 3.') == 'one owt 3.'

p reverse_odd('this is a     much longer      string with extraordinary lettering   .') == 'this si a hcum longer gnirts with yranidroartxe lettering.'
