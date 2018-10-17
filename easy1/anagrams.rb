=begin
Write a program that, given a word and a list of possible anagrams, 
selects the correct sublist that contains the anagrams of the word.

For example, given the word "listen" and a list of candidates like 
"enlists" "google" "inlets" "banana" 
the program should return a list containing "inlets". 
Please read the test suite for exact rules of anagrams.
---
input: target string, array of strings
output: array of strings that are angagrams of target
  - case insensitive

- convert target str to chars and sort
- step through array of possible matches
  - convert to chars and sort
  - compare with target
  - add pre-converted to results list if match


=end

# could break out the anagrams test into a private helper and make match just a select

class Anagram
  def initialize(target_word)
    @word = target_word
    @sorted_word = sort_chars(@word)
  end

  def match(candidates)
    candidates.select { |c| sort_chars(c) == @sorted_word && c.downcase != @word.downcase }
  end

  private

  def sort_chars(word) 
    word.downcase.chars.sort
  end
end

d = Anagram.new('Orchestra')
d.match %w(cashregister Carthorse radishes)
